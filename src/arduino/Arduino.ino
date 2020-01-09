<<<<<<< HEAD
/*By Nator Verinumbe and Solomon
University of Ibadan
10/October/2019
*/

const int trigPin = 7;
const int echoPin = 8;

//#include <LiquidCrystal.h> // includes the LiquidCrystal Library 
//LiquidCrystal lcd(1, 2, 3, 4, 5, 6); // Creates an LC object. Parameters: (rs, enable, d4, d5, d6, d7)

#define enA 9
#define in1 11
#define in2 12
#define enB 10
#define in3 13
#define in4 22

int motorSpeedA = 0;
int motorSpeedB = 0;
int val, xVal, zVal;
int xMin = 80;
int xMax = 160;
int zMin = 10;
int zMax = 50;
int distance;
int read_dist_ultra_sensor(); //function prototyping for distance measuring (ultrasonic sensors)

void setup(){
  Serial.begin(9600);
  //lcd.begin(16,2);
  pinMode(enA, OUTPUT);
  pinMode(enB, OUTPUT);
  pinMode(in1, OUTPUT);
  pinMode(in2, OUTPUT);
  pinMode(in3, OUTPUT);
  pinMode(in4, OUTPUT);
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT); // Sets the echoPin as an Input
}

void loop() {

distance = read_dist_ultra_sensor();


if (Serial.available()>2) { // If data is available to read,
  val = Serial.read();
  if(val == 'S'){
          // read the most recent byte (which will be from 0 to 255):
          //int a = Serial.read();
          //if (a =1)
          //lcd.print("stand for kindly stand upright for scanning)");
          //int b = Serial.read();
          //if (b =1)
          //lcd.print("scanning completed");
          //delay (5000);
          //lcd.print("Please proceed to shopping");
      
          xVal = Serial.read();
          zVal = Serial.read();
      
    //backward   
    while ( distance < 40){  //caution from ultrasonic sensors

      if (zVal < zMin) {
            // Set Motor A backward
            digitalWrite(in2, HIGH);
            digitalWrite(in1, LOW);
            // Set Motor B backward
            digitalWrite(in3, HIGH);
            digitalWrite(in4, LOW);
            // Convert the declining Y-axis readings for going backward from 470 to 0 into 0 to 255 value for the PWM signal for increasing the motor speed
            motorSpeedA = map(zVal, zMin, 0, 200, 255);
            motorSpeedB = map(zVal, zMin, 0, 200, 255);
      
      
            //backward right, A is higher
            if (xVal <= xMin) {
      
                int xMapped = map(xVal, xMin, 0, 200, 255);
                // Move to left - decrease left motor speed, increase right motor speed
                motorSpeedA = motorSpeedA + xMapped;
                motorSpeedB = motorSpeedB - xMapped;
            }
        
            //backward left, B is higher
            else if (xVal >= xMax) {
      
              int xMapped = map(xVal, 225, xMax, 255, 200);
              // Move to left - decrease left motor speed, increase right motor speed
              motorSpeedA = motorSpeedA - xMapped;
              motorSpeedB = motorSpeedB + xMapped;
            }
      
       }
    
    
    
       //forward
      else if (zVal >= zMin) {
          // Set Motor A forward
          digitalWrite(in2, LOW);
          digitalWrite(in1, HIGH);
          // Set Motor B forward
          digitalWrite(in4, HIGH);
          digitalWrite(in3, LOW);
    
          motorSpeedA = map(zVal, zMax,255, 200, 255);
          motorSpeedB = map(zVal, zMax,255, 170, 255);
    
    
          //forward right, b is higher
          if (xVal <= xMin) {
    
            int xMapped = map(xVal, xMin, 0, 200, 255);
            // Move to left - decrease left motor speed, increase right motor speed
            motorSpeedA = motorSpeedA - xMapped;
            motorSpeedB = motorSpeedB + xMapped;
          }
    
          //forward left, A is higher
          else if (xVal >= xMax) {
    
            int xMapped = map(xVal, 225, xMax, 255, 200);
            // Move to left - decrease left motor speed, increase right motor speed
            motorSpeedA = motorSpeedA + xMapped;
            motorSpeedB = motorSpeedB - xMapped;
          }
    
          // stop
          else if (xVal > xMin && xVal < xMax) {
            if (zVal <= zMax){
              motorSpeedA = 0;
              motorSpeedB = 0;
            }
      }
    
  }


    
            if (motorSpeedA < 0) {
              motorSpeedA = 0;
            }
            if (motorSpeedB > 255) {
              motorSpeedB = 255;
            }
              if (motorSpeedB < 0) {
              motorSpeedB = 0;
            }
            if (motorSpeedA > 255) {
              motorSpeedA = 255; //max speed
            }



       analogWrite(enA, motorSpeedA); // Send PWM signal to motor A
       analogWrite(enB, motorSpeedB); // Send PWM signal to motor B  
      }
    
    
    
     }
  }


}


int read_dist_ultra_sensor(){

  long duration;
  digitalWrite(trigPin, LOW);//to clear it of stray current
  delayMicroseconds(2);
  
  //Sets the trigPin on HIGH state for 10 micro seconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10); //this tells the sensor to send out a sound wave
  digitalWrite(trigPin, LOW);
  
  // Reads the echoPin, returns the sound wave travel time in microseconds
  duration = pulseIn(echoPin, HIGH);
  
  // Calculating the distance
  return (duration*0.034/2);

}
//sdfasd
=======
/*By Nator Verinumbe and Solomon
University of Ibadan
10/October/2019
*/

const int trigPin = 7;
const int echoPin = 8;

//#include <LiquidCrystal.h> // includes the LiquidCrystal Library 
//LiquidCrystal lcd(1, 2, 3, 4, 5, 6); // Creates an LC object. Parameters: (rs, enable, d4, d5, d6, d7)

#define enA 9
#define in1 11
#define in2 12
#define enB 10
#define in3 13
#define in4 22

int motorSpeedA = 0;
int motorSpeedB = 0;
int val, xVal, zVal;
int xMin = 80;
int xMax = 160;
int zMin = 10;
int zMax = 50;
int distance;
int read_dist_ultra_sensor(); //function prototyping for distance measuring (ultrasonic sensors)

void setup(){
  Serial.begin(9600);
  //lcd.begin(16,2);
  pinMode(enA, OUTPUT);
  pinMode(enB, OUTPUT);
  pinMode(in1, OUTPUT);
  pinMode(in2, OUTPUT);
  pinMode(in3, OUTPUT);
  pinMode(in4, OUTPUT);
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT); // Sets the echoPin as an Input
}

void loop() {

distance = read_dist_ultra_sensor();


if (Serial.available()>2) { // If data is available to read,
  val = Serial.read();
  if(val == 'S'){
          // read the most recent byte (which will be from 0 to 255):
          //int a = Serial.read();
          //if (a =1)
          //lcd.print("stand for kindly stand upright for scanning)");
          //int b = Serial.read();
          //if (b =1)
          //lcd.print("scanning completed");
          //delay (5000);
          //lcd.print("Please proceed to shopping");
      
          xVal = Serial.read();
          zVal = Serial.read();
      
    //backward   
    while ( distance < 40){  //caution from ultrasonic sensors

      if (zVal < zMin) {
            // Set Motor A backward
            digitalWrite(in2, HIGH);
            digitalWrite(in1, LOW);
            // Set Motor B backward
            digitalWrite(in3, HIGH);
            digitalWrite(in4, LOW);
            // Convert the declining Y-axis readings for going backward from 470 to 0 into 0 to 255 value for the PWM signal for increasing the motor speed
            motorSpeedA = map(zVal, zMin, 0, 200, 255);
            motorSpeedB = map(zVal, zMin, 0, 200, 255);
      
      
            //backward right, A is higher
            if (xVal <= xMin) {
      
                int xMapped = map(xVal, xMin, 0, 200, 255);
                // Move to left - decrease left motor speed, increase right motor speed
                motorSpeedA = motorSpeedA + xMapped;
                motorSpeedB = motorSpeedB - xMapped;
            }
        
            //backward left, B is higher
            else if (xVal >= xMax) {
      
              int xMapped = map(xVal, 225, xMax, 255, 200);
              // Move to left - decrease left motor speed, increase right motor speed
              motorSpeedA = motorSpeedA - xMapped;
              motorSpeedB = motorSpeedB + xMapped;
            }
      
       }
    
    
    
       //forward
      else if (zVal >= zMin) {
          // Set Motor A forward
          digitalWrite(in2, LOW);
          digitalWrite(in1, HIGH);
          // Set Motor B forward
          digitalWrite(in4, HIGH);
          digitalWrite(in3, LOW);
    
          motorSpeedA = map(zVal, zMax,255, 200, 255);
          motorSpeedB = map(zVal, zMax,255, 170, 255);
    
    
          //forward right, b is higher
          if (xVal <= xMin) {
    
            int xMapped = map(xVal, xMin, 0, 200, 255);
            // Move to left - decrease left motor speed, increase right motor speed
            motorSpeedA = motorSpeedA - xMapped;
            motorSpeedB = motorSpeedB + xMapped;
          }
    
          //forward left, A is higher
          else if (xVal >= xMax) {
    
            int xMapped = map(xVal, 225, xMax, 255, 200);
            // Move to left - decrease left motor speed, increase right motor speed
            motorSpeedA = motorSpeedA + xMapped;
            motorSpeedB = motorSpeedB - xMapped;
          }
    
          // stop
          else if (xVal > xMin && xVal < xMax) {
            if (zVal <= zMax){
              motorSpeedA = 0;
              motorSpeedB = 0;
            }
      }
    
  }


    
            if (motorSpeedA < 0) {
              motorSpeedA = 0;
            }
            if (motorSpeedB > 255) {
              motorSpeedB = 255;
            }
              if (motorSpeedB < 0) {
              motorSpeedB = 0;
            }
            if (motorSpeedA > 255) {
              motorSpeedA = 255; //max speed
            }



       analogWrite(enA, motorSpeedA); // Send PWM signal to motor A
       analogWrite(enB, motorSpeedB); // Send PWM signal to motor B  
      }
    
    
    
     }
  }


}


int read_dist_ultra_sensor(){

  long duration;
  digitalWrite(trigPin, LOW);//to clear it of stray current
  delayMicroseconds(2);
  
  //Sets the trigPin on HIGH state for 10 micro seconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10); //this tells the sensor to send out a sound wave
  digitalWrite(trigPin, LOW);
  
  // Reads the echoPin, returns the sound wave travel time in microseconds
  duration = pulseIn(echoPin, HIGH);
  
  // Calculating the distance
  return (duration*0.034/2);

}
//sdfasd
>>>>>>> updates
