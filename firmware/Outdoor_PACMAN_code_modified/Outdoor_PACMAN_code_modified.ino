      /*
       * Outdoor Dust Information Node - ODIN
       */
      #include <SPI.h>
      #include <RTClib.h> //Chronodot library
      #include "DHT.h"   //DHT22 library
      #include <SD.h>    //SD library
      #include <Wire.h> //Aux Chronodot library
      #include <avr/interrupt.h>
      #include <avr/power.h>
      #include <avr/sleep.h>
      #include <avr/io.h>
      //Chronodot setup
      #include "Chronodot.h"  
      Chronodot RTC;
      DateTime time;  
      
      #define CLOCK_ADDRESS 0x68
      // DHT22 setup
      #define DHTPIN 9     // what pin we're connected to
      #define DHTTYPE DHT22   // DHT 22  (AM2302)    
      // Connect pin 1 (on the left) of the sensor to +5V
      // Connect pin 2 of the sensor to whatever your DHTPIN is
      // Connect pin 4 (on the right) of the sensor to GROUND
      // Connect a 10K resistor from pin 2 (data) to pin 1 (power) of the sensor
      DHT dht(DHTPIN, DHTTYPE);
      
      //SD and filesystem setup
      /*
       * SD card attached to SPI bus as follows:
       * MOSI - pin 11, MISO - pin 12, CLK - pin 13, CS - pin 4 (CS pin can be changed)
        and pin #10 (SS) must be an output
       */
      File dataFile;
      // change this to match your SD shield or module;
      //  Adafruit SD shields and modules: pin 10
      const int chipSelect = 10;
      
      
      // Declare the variables strings and char for naming the SD Card file name
      String fname;
      String currdir;
      char file_fname[50];
  
      String sdCard;
            
     //Dust Sensor constants and variables
      int dustMeasure = 0;  //Analog input Pin 0
      int dustTRIG = 4;  //Trigger pin for Dust sensor 
      long int dust = 0; //Raw signal from dust sensor
      long int dustVoltage = 0; // Raw signal converted to voltage
      int delay_to_sample = 280; //Microseconds after the trigger, see datasheet.
      long int average;
      int Nsamples = 100;
      int count = 0;
      const int buttonPin = 8;     // the digital pin that the alarm output is connected to(SQW)
      const int ledPin = 5;	// digital pin that has the CARD STATUS LED attached to.
      const int battPin= 3;	//Analog pin for the battery voltage read
      float h,t;
      int buttonState = 0;         // variable for reading the alarm status(LOW or HIGH)      
   
      
      long int dusttotal = 0;
      long int highdust = 0;
      long int lowdust = 1000;
             
    long int dustSignal() {
	dust=0;
	dusttotal = 0;
	highdust = 0;
	lowdust = 2000;
	average = 0;
	
	for (int i=0;i<Nsamples;i++){  
	  digitalWrite(dustTRIG,LOW); 
	  delayMicroseconds(delay_to_sample);
	  dust=analogRead(dustMeasure);
	  dusttotal = dusttotal + dust;
	  highdust = max(highdust, dust);
	  lowdust = min(lowdust, dust);
	  digitalWrite(dustTRIG,HIGH); 
	  delayMicroseconds(9720);
	}
	average = dusttotal/Nsamples; 
	long int xdustVoltage = average*5000/1024;
	return xdustVoltage;
	
      }
         
      // Reading temperature or humidity takes about 250 milliseconds!
      // Sensor readings may also be up to 2 seconds 'old' (its a very slow sensor)
      float tempRead(){
        float t = dht.readTemperature();
        return t;    
      }  
        // Reading temperature or humidity takes about 250 milliseconds!
        // Sensor readings may also be up to 2 seconds 'old' (its a very slow sensor)
      float humidRead(){
        float h = dht.readHumidity();  
        return h;    
      }
      
      
       String timestring(){
	          // This function gets the data from the Chronodot and converts to strings.

            time=RTC.now();
            
            String xmonth, xday, xhour, xminute, xsecond;
            
            // For one digit months
             if (time.month()<10){
              xmonth="0"+String(time.month());
            }
              else {
               xmonth=String(time.month());
            }
            //One digit days
            if (time.day()<10){
                xday="0"+String(time.day());
                }
              else {
              xday=String(time.day());
              }
                       
            //For one digit hours
             if (time.hour()<10){
              xhour="0"+String(time.hour());
            }
              else {
               xhour=String(time.hour());
            }
            //One digit minutes
            if (time.minute()<10){
                xminute="0"+String(time.minute());
                }
              else {
              xminute=String(time.minute());
              }
            //One digit seconds
            if (time.second()<10){
                xsecond="0"+String(time.second());
                }
              else {
                xsecond=String(time.second());
                }
            // xx2 gives date and time when sensor data collected.    
            String xx=String(time.year())+"/"+xmonth+"/"+xday;
            String xx2= xx+"\t"+xhour+":"+xminute+":"+xsecond;
            
                    
            // Conversion of the month and date to a string which will be displayed as the sdCard file name 
            String xx3=String(time.year())+xmonth+xday; 
            // Obtain the string xx and save as the name of the sdCard file           
            sdCard = xx3;                
            
           return xx2;
          }
      
      void tosdCard(){
	// This function writes the headers of the data file on to the SD Card
	dataFile.print("Date");
	dataFile.print("\t");
	dataFile.print("Time");
	dataFile.print("\t");
	dataFile.print("Dust");
	dataFile.print("\t");
	dataFile.print("Humidity");
	dataFile.print("\t");
	dataFile.print("Battery");
	dataFile.print("\t");
	dataFile.println("Temperature");
	
	Serial.println(fname); // Show the file name of the created file
	Serial.print("Date");
	Serial.print("\t");
	Serial.print("Time"); 
	Serial.print("\t");
	Serial.print("Dust");
	Serial.print("\t");
	Serial.print("Humidity");
	Serial.print("\t");
	Serial.print("Battery");
	Serial.print("\t");
	Serial.print("Temperature");
	Serial.println("\t");
	count = 1;
      }
      
      void RTC_send_register(byte reg, byte value){
	// This function writes and read data from the chronodot registers
        Wire.beginTransmission(CLOCK_ADDRESS);
        Wire.write(reg); 
        Wire.write(value);
        Wire.endTransmission();
       }
      
      void sleepNow(void)
    {
    // Set pin 2 as interrupt and attach handler:
    attachInterrupt(1, pinInterrupt, LOW); // Interrupt on digital pin 3.
    delay(100);
    //
    // Choose our preferred sleep mode:
   set_sleep_mode(SLEEP_MODE_PWR_DOWN);// lowest power mode
   //
    // Set sleep enable (SE) bit:
    sleep_enable();
    //
    // Put the device to sleep:
    sleep_mode();
    //
    // Upon waking up, sketch continues from this point.
    sleep_disable();
    RTC_send_register(0x0F,0);// Cancel alarm flag so interrupt not reasserted
    }  
    void pinInterrupt(void)
      {
          detachInterrupt(1);
      }
      
      void setup() {
        Serial.begin(9600);
        // Pilfered from elsewhere - enable input pullups to minimise leakage when asleep.
        DDRD &= B00000011;       // set Arduino pins 2 to 7 as inputs, leaves 0 & 1 (RX & TX) as is
        DDRB = B00000000;        // set pins 8 to 13 as inputs
        PORTD |= B11111100;      // enable pullups on pins 2 to 7
        PORTB |= B11111111;      // enable pullups on pins 8 to 13
        dht.begin();  
        Wire.begin();
        RTC.begin();
        
        pinMode(dustTRIG,OUTPUT);
            
         Serial.print("Initializing SD card...");
        // On the Ethernet Shield, CS is pin 4. It's set as an output by default.
        // Note that even if it's not used as the CS pin, the hardware SS pin 
        // (10 on most Arduino boards, 53 on the Mega) must be left as an output 
        // or the SD library functions will not work. 
         pinMode(10, OUTPUT);
         
          if (!SD.begin(chipSelect)) {
          Serial.println("initialization failed!");
	  digitalWrite(ledPin,HIGH);
          return;
        }   
           Serial.println("initialization done.");
         // Checks if the RTC is running
          if (! RTC.isrunning()) {
             Serial.println("RTC is NOT running!");
          }
          
          // DateTime now = RTC.now();
          // Set the alarm to go off at each minute
          // Write to the 7,8,9 and A registers on Alarm1
          RTC_send_register(0x07,B00000000);
          RTC_send_register(0x08,B10000000);
          RTC_send_register(0x09,B10000000);
          RTC_send_register(0x0A,B10000000);
          // This will enable Alarm and also enables the alarm interrupt to be generated on the SQW pin
          RTC_send_register(0x0E,B00000101);  
          RTC_send_register(0x0F,0); // 28_08_2014 Discovered that it is important to reset SQW interrupt when power up ODIN                                            
      }
    
    
      void loop() {

          String currTstr=timestring();    // Call the timestring function to gather current date and time
	  // Obtain the average of 20 measurements ... between 20 and 30 seconds.
	  // Calculate averages and save those averages
	  int fsmp;
	  dustVoltage = 0;
	  h = 0.0;
	  t = 0.0;
	  for (fsmp = 0;fsmp<20;fsmp++){
		  //Call the dustSignal function to measure dust
		  dustVoltage = dustVoltage + dustSignal();
	  }
	  dustVoltage = dustVoltage / fsmp
	  // Call the humidity and Temperature functions to read the current values 
	  h = humidRead();
	  t = tempRead();
	  // open the file. Note that only one file can be open at a time,
	  // Thus you have to close this one before opening another.
	  //fname=String("DATA_"+String(sdCard)+".txt");
	  fname=String(String(sdCard)+".txt");
	  fname.toCharArray(file_fname,fname.length()+1); // Convert the string to char   
	  dataFile = SD.open(file_fname, FILE_WRITE);

	  // if the file has opend, call the functions then write the data on the file
          if (dataFile) {          
            if (count <1){
              tosdCard();
            }
          
           // Print the current date and time on to the SD Card and the Serial Port
           dataFile.print(currTstr);
           dataFile.print("\t");
           Serial.print(currTstr);
           Serial.print("\t");
           
         // check if returns are valid, if they are NaN (not a number) then something went wrong!
          if (isnan(t) || isnan(h)) {
	    dataFile.println("Failed to read from DHT");
	    Serial.println("Failed to read from DHT");
	  } else {
            // Write the gathered data on to the SD Card file
	    dataFile.print(dustVoltage);
	    dataFile.print("\t");
	    dataFile.print(h);                     
            dataFile.print("\t");
            dataFile.print(t);
	    dataFile.print("\t");
	    dataFile.println(analogRead(battPin));
          }
          // close the file:
          dataFile.close();
	  // Output to serial
	  Serial.print(dustVoltage);
	  Serial.print("\t");
	  Serial.print(h);
	  Serial.print("\t");
	  Serial.print(t);
	  Serial.print("\t");
	  Serial.println(analogRead(battPin));
	  }
	  else {
	    // if the file didn't open, print an error:
	    // Serial.println("error opening test.txt");
	    // dataFile.println("error opening Data.txt");
	    Serial.println("error opening Data.txt");
	    Serial.println(fname); // If the file does not open, display the file name/ just for testing purpose
	    int attack;
	    for (attack = 1;attack < 60; attack++){
		    digitalWrite(13,HIGH);
		    delay(250);
		    digitalWrite(13,LOW);
		    delay(250);
            }
	    delay(60000);
	  }
  sleepNow();  
    }
          
    
