#include "Servo.h"
int buzzer1 = 11;
int buzzer2 = 10;
int buzzer3 = 9;
int buzzer4 = 5;
int servoPin = 3;
int activateServo = 2;
Servo Servo1;

void setup() {
  // put your setup code here, to run once:
  pinMode( 11, OUTPUT);
  pinMode( 10, OUTPUT);
  pinMode( 9, OUTPUT);
  pinMode( 5, OUTPUT);
  pinMode( servoPin, OUTPUT);
  pinMode(activateServo, INPUT);
  Servo1.attach(servoPin);


}

void loop() {
  // put your main code here, to run repeatedly:
  int buttonState = digitalRead(activateServo);
  tone (buzzer2, 1000, 10);
  delay(11);
  tone (buzzer1, 400, 10 );
  delay(11);
  tone (buzzer3, 4000, 10);
  delay(11);
  tone (buzzer4, 10000, 10);
  delay(11);
  //  Make servo go to 0 degrees
  Servo1.write(0);
  if (buttonState == 1) {
    //  Make servo go to 90 degrees
    Servo1.write(45);
    delay(300);
    Servo1.write(0);
    delay(100);
  }
}
