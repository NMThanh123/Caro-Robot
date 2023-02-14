
#include <AccelStepper.h>
#include <math.h>

AccelStepper stepper1(1, 2, 5); // (Type:driver, STEP, DIR)
AccelStepper stepper2(1, 3, 6);
AccelStepper stepper3(1, 4, 7);




double  z,t1,t2;
float n=0.00;
String content = "";
int data[5],dau;
int stepper1Position, stepper2Position, stepper3Position,m=30;
float i,j;

const float theta1AngleToSteps = 35.555555;
const float theta2AngleToSteps = 26.666666;
const float zDistanceToSteps = 400;

void setup() {

  Serial.begin(9600);
  stepper1.setMaxSpeed(4000);
  stepper1.setAcceleration(2000);
  stepper2.setMaxSpeed(4000);
  stepper2.setAcceleration(2000);
  stepper3.setMaxSpeed(4000);
  stepper3.setAcceleration(2000);
 


  
 
}

void loop() {
  

  if (Serial.available()) {
    content = Serial.readString(); 
    for (int l = 0; l < 5; l++) {
      int index = content.indexOf(","); 
      data[l] = atol(content.substring(0, index).c_str()); 
      content = content.substring(index + 1); 
      Serial.println(data[l]);
    }
    n=float(data[0]);
    dau=data[1];
    if (data[0]==3){
      j=float(abs(data[3]-2));
      i=float(abs(data[2]-2));
    }

    else if (data[0]==5){
      j=float(abs(data[3]-4));
      i=float(abs(data[2]-4));
    }

    else if (data[0]==7){
      j=float(abs(data[3]-6));
      i=float(abs(data[2]-6));
    }
    else if (data[0]==9){
      j=float(abs(data[3]-8));
      i=float(abs(data[2]-8));
    }
    
    if(dau==0){
      ve_chu_x();
    }
    else if (dau==1){
     
      ve_vong_tron();
    }
    
  }

 

 
}



void ve_vong_tron(){
  stepper1.setCurrentPosition(0);
  stepper2.setCurrentPosition(0);
  stepper3.setCurrentPosition(0);
  float L=300.00,l01=110.00,l02=150.00,r=10.00;

float Xij,Yij,X,Y,A,B;

 for ( float t=0;t<=2*PI;t=t+0.01){

    Xij=(L/n)*i+(L/n)/2.0;
    Yij=(L/n)*j+(L/n)/2.0;
   X=Xij+r*sin(t);
   Y=Yij+r*cos(t);
   
   A=l02-X;B=Y+l01;
      stepper1.setSpeed(4000);
    stepper2.setSpeed(4000);
stepper3.setSpeed(4000);

     stepper1.setAcceleration(2000);
    stepper2.setAcceleration(2000);
    stepper3.setAcceleration(2000);

tinh(A,B);


     stepper1Position=t1*theta1AngleToSteps;
    stepper2Position=t2*theta2AngleToSteps;

    stepper3Position=m*zDistanceToSteps;
    stepper1.moveTo(stepper1Position);
      stepper2.moveTo(stepper2Position);
      stepper3.moveTo(stepper3Position);
      while (stepper1.currentPosition() != stepper1Position|| stepper2.currentPosition() != stepper2Position) {
        stepper1.run();
        stepper2.run();
      }
      if(t==0.00){
       while (stepper3.currentPosition() != stepper3Position) {
        stepper3.run();
      }
      }



 
}
stepper3.setSpeed(-4000);
 while (stepper3.currentPosition() != 0) {
    
    stepper3.runSpeed();
  }
  delay(20);

  
stepper1.moveTo(0);
stepper2.moveTo(0);
while (stepper1.currentPosition() != 0|| stepper2.currentPosition() != 0) {
 stepper1.run();
stepper2.run();
}

}

void ve_chu_x(){
  stepper1.setCurrentPosition(0);
  stepper2.setCurrentPosition(0);
  stepper3.setCurrentPosition(0);
  float L=300.00,l01=110.00,l02=150.00,r=10.00;

float Xij,Yij,X,Y,A,B;

 for ( float t=0;t<=2*r;t=t+0.5){

    Xij=(L/n)*i+(L/n)/2.0-r;
    Yij=(L/n)*j+(L/n)/2.0-r;
   X=Xij+t;
   Y=Yij+t;
   
   A=l02-X;B=Y+l01;
      stepper1.setSpeed(4000);
    stepper2.setSpeed(4000);
stepper3.setSpeed(4000);

     stepper1.setAcceleration(2000);
    stepper2.setAcceleration(2000);
    stepper3.setAcceleration(2000);

tinh(A,B);


     stepper1Position=t1*theta1AngleToSteps;
    stepper2Position=t2*theta2AngleToSteps;

    stepper3Position=m*zDistanceToSteps;
    stepper1.moveTo(stepper1Position);
      stepper2.moveTo(stepper2Position);
      stepper3.moveTo(stepper3Position);
      while (stepper1.currentPosition() != stepper1Position|| stepper2.currentPosition() != stepper2Position) {
        stepper1.run();
        stepper2.run();
      }
      if(t==0.00){
       while (stepper3.currentPosition() != stepper3Position) {
        stepper3.run();
      }
      }
}
stepper3.setSpeed(-4000);
   
  while (stepper3.currentPosition() != stepper3Position-4000) {
     stepper3.runSpeed();
  }

for ( float t=2*r;t>=0;t=t-0.5){

    Xij=(L/n)*i+(L/n)/2.0+r;
    Yij=(L/n)*j+(L/n)/2.0-r;
   X=Xij-t;
   Y=Yij+t;
   
   A=l02-X;B=Y+l01;
      stepper1.setSpeed(4000);
    stepper2.setSpeed(4000);
stepper3.setSpeed(4000);

     stepper1.setAcceleration(2000);
    stepper2.setAcceleration(2000);
    stepper3.setAcceleration(2000);

tinh(A,B);

     stepper1Position=t1*theta1AngleToSteps;
    stepper2Position=t2*theta2AngleToSteps;

    stepper3Position=m*zDistanceToSteps;
    stepper1.moveTo(stepper1Position);
      stepper2.moveTo(stepper2Position);
      stepper3.moveTo(stepper3Position);
      while (stepper1.currentPosition() != stepper1Position|| stepper2.currentPosition() != stepper2Position) {
        stepper1.run();
        stepper2.run();
      }
      if(t==20.00){
       while (stepper3.currentPosition() != stepper3Position) {
        stepper3.run();
      }
      }
 
}
 stepper3.setSpeed(-4000);
 while (stepper3.currentPosition() != 0) {
    
    stepper3.runSpeed();
  }
stepper1.moveTo(0);
stepper2.moveTo(0);
while (stepper1.currentPosition() != 0|| stepper2.currentPosition() != 0) {
 stepper1.run();
stepper2.run();
}
}

void tinh(float x, float y)
{
        float l2 = 310.0; 
    float l3 = 305.0; 
    double c2,s2,c1,s1;

        c2 = (pow(x,2) + pow(y,2) - pow(l2,2) - pow(l3,2))/(2*l2*l3);
        s2 = sqrt(abs(1 - pow(c2,2)));
        t2 = atan2(s2,c2)*180/PI;

        s1 = y*(l3*c2  + l2) - x*(l3*s2);
        c1 = x*(l3*c2 + l2) + y*(l3*s2);
        t1 = atan2(s1,c1)*180/PI;

 
}
