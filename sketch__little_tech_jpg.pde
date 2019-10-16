/*import SimpleOpenNI.*;
SimpleOpenNI kinect;
//PImage depth_img;

void setup(){
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();//starts depth sensors i.e  enable depthMap generation 
  kinect.enableUser(); // enable skeleton generation for all joints
  size(640,480); //sets size(resolution) of display screen
  fill(255,0,0); //fills the box display
  smooth();
  //depth_img = kinect.depthImage();
}  

void draw(){
 kinect.update();
 image(kinect.depthImage(), 0, 0);
 
 IntVector userList = new IntVector(); //an arraylist
 kinect.getUsers(userList); //used to fill the arraylist
 
  if (userList.size() > 0) { //.length() can't be used here since it's an array list
   int userId = userList.get(0);  //
   
     if( kinect.isTrackingSkeleton(userId)){
       println("Start tracking");
       drawSkeleton(userId);
     }
  }
}
 
 
 
 void drawSkeleton(int userId) {
   stroke(0);
   strokeWeight(5);
  
   kinect.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);
   kinect.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
   kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
   kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);
   kinect.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
   kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
   kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);
   kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
   kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
   kinect.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
   kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
   kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);
   kinect.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
   kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
   kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);
   kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_LEFT_HIP);
  
   noStroke();
  
   fill(255,0,0);
   drawJoint(userId, SimpleOpenNI.SKEL_HEAD);
   drawJoint(userId, SimpleOpenNI.SKEL_NECK);
   drawJoint(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER);
   drawJoint(userId, SimpleOpenNI.SKEL_LEFT_ELBOW);
   drawJoint(userId, SimpleOpenNI.SKEL_NECK);
   drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
   drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW);
   drawJoint(userId, SimpleOpenNI.SKEL_TORSO);
   drawJoint(userId, SimpleOpenNI.SKEL_LEFT_HIP);
   drawJoint(userId, SimpleOpenNI.SKEL_LEFT_KNEE);
   drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_HIP);
   drawJoint(userId, SimpleOpenNI.SKEL_LEFT_FOOT);
   drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_KNEE);
   drawJoint(userId, SimpleOpenNI.SKEL_LEFT_HIP);
   drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_FOOT);
   drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_HAND);
   drawJoint(userId, SimpleOpenNI.SKEL_LEFT_HAND);
}

void drawJoint(int userId, int jointID) {
   PVector joint = new PVector(); 
   //checks the confidence level
   float confidence = kinect.getJointPositionSkeleton(userId, jointID,
  joint); 
  
   if(confidence < 0.5){
       return;
   }
   
   PVector convertedJoint = new PVector();
   kinect.convertRealWorldToProjective(joint, convertedJoint);
   ellipse(convertedJoint.x, convertedJoint.y, 5, 5);
}

//Calibration not required

void onNewUser(SimpleOpenNI kinect, int userID){
  println("Start skeleton tracking");
  kinect.startTrackingSkeleton(userID);
}*/



import SimpleOpenNI.*;
import processing.serial.*;
SimpleOpenNI kinect;
Serial myPort;
PVector com = new PVector();
PVector com2d = new PVector();

void setup() {
 kinect = new SimpleOpenNI(this);
 kinect.enableDepth();
 kinect.enableUser();// this changed
 size(640, 480);
 fill(255, 0, 0);
 String portName = Serial.list()[0]; // This gets the first port on your computer.
 myPort = new Serial(this, portName, 9600);
 myPort.bufferUntil('\n');
}

void draw() {
  kinect.update();
// image(kinect.depthImage(), 0, 0);
  image(kinect.userImage(), 0, 0);

  IntVector userList = new IntVector();
  kinect.getUsers(userList);

  if (userList.size() > 0) {
  int userId = userList.get(0);

    if ( kinect.isTrackingSkeleton(userId)) {
    drawSkeleton(userId);
    MassUser(userId);
    }
  }
}

void drawSkeleton(int userId) {
 stroke(0);
 strokeWeight(5);

 kinect.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);
 kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_LEFT_HIP);
 noStroke();
 fill(255,0,0);
 drawJoint(userId, SimpleOpenNI.SKEL_HEAD);
 drawJoint(userId, SimpleOpenNI.SKEL_NECK);
 drawJoint(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER);
 drawJoint(userId, SimpleOpenNI.SKEL_LEFT_ELBOW);
 drawJoint(userId, SimpleOpenNI.SKEL_NECK);
 drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
 drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW);
 drawJoint(userId, SimpleOpenNI.SKEL_TORSO);
 drawJoint(userId, SimpleOpenNI.SKEL_LEFT_HIP);
 drawJoint(userId, SimpleOpenNI.SKEL_LEFT_KNEE);
 drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_HIP);
 drawJoint(userId, SimpleOpenNI.SKEL_LEFT_FOOT);
 drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_KNEE);
 drawJoint(userId, SimpleOpenNI.SKEL_LEFT_HIP);
 drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_FOOT);
 drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_HAND);
 drawJoint(userId, SimpleOpenNI.SKEL_LEFT_HAND);
}

void drawJoint(int userId, int jointID) {
 PVector joint = new PVector();

 float confidence = kinect.getJointPositionSkeleton(userId, jointID,
joint);
 if(confidence < 0.5){
   return;
 }
 PVector convertedJoint = new PVector();
 kinect.convertRealWorldToProjective(joint, convertedJoint);
 ellipse(convertedJoint.x, convertedJoint.y, 5, 5);
}


//Calibration not required
void onNewUser(SimpleOpenNI kinect, int userID){
  println("Start skeleton tracking");
  kinect.startTrackingSkeleton(userID);
}

void MassUser(int userId) {
        if(kinect.getCoM(userId,com)) {
                kinect.convertRealWorldToProjective(com,com2d);
                stroke(100,255,240);
                strokeWeight(3);
                beginShape(LINES);
                  vertex(com2d.x,com2d.y - 5);
                  vertex(com2d.x,com2d.y + 5);
                  vertex(com2d.x - 5,com2d.y);
                  vertex(com2d.x + 5,com2d.y);
                endShape();
                fill(0,255,100);
                text(Integer.toString(userId),com2d.x,com2d.y);
fill(255,0,0);
                scale(1);
                int x = int(255*com2d.x/width);
                int z = int(255*com2d.z/1500);
                if (z> 255)
                z=255;
                text("X: " + com2d.x + "\n" + "X2:" + x + "\n" + "Z:" + com2d.z + "\n" + "Z2:" + z, 20, 90);
                 // Send a marker to indicate the beginning of the communication
             myPort.write('S');
                myPort.write (x);
                myPort.write (z);
        }
}
