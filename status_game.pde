import com.hamoid.*;

VideoExport videoExport;


boolean exp = false;        //change to true if you want the video to be exported
String credit = "1434 3432 6654 0343";    //credit digits, will be shown when shapes are aligned


String date = "";
color _green = #00FF00;
color _red = #FF0000;
color _blue = #0000FF; 
color _white = #FFFFFF;
String out = "";
int offset = int(random(-1,2));
int tm = 5-offset;

void setup(){
  size(700, 700, P3D);
  smooth();
  lights();
  if (exp){
    videoExport = new VideoExport(this, "export.mp4");    //name of the exported video, will be overwritten if it exists in the sketch folder
    videoExport.startMovie();
    
  }
  date = day()+"/"+month()+"/"+year();
  
}

void draw(){
  background(0);    //black background
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  textAlign(RIGHT, CENTER);
  textSize(20);
  fill(255);
  translate(width/2, height/2,200);

  pushMatrix();
  
  if (tm == 0){    //shapes will be aligned when tm is 0, so we pass the 'credit' to the 'out' string
    out = credit;
  } else {
    out =  ran() +" "+ran() +" "+ran() +" "+ran();      //otherwise randomize the numbers
  }
  textAlign(CENTER, CENTER);
  text(out, 0, 200);
  textSize(10);
  textAlign(RIGHT, CENTER);
  text(date, 200, -200);
  
  
  _triangle(0, 0, _green, false);
  _rectangle(0, 0, _blue, false);        //draws the static outline
  _circle(0, 0, _red, false);
  
  rotateX(1*tm);
  _triangle(15*tm, 15*tm, _green, true);
  rotateX(-(1*tm));
  rotateY(1*tm);
  _rectangle(-20*tm, -10*tm, _blue, true);    //draws the moving shapes
  rotateY(-(1*tm));
  rotateX(-1*tm);
  _circle(-25*tm,-5*tm, _red, true);
 
  
  
  if (!(tm <= -5-offset)){
    if(exp){
      videoExport.saveFrame();
    }
    tm--;
  } else {    
    if(exp){
      videoExport.endMovie();
      exit();          //exits the sketch after export is complete
    }
    tm = 5-offset;      //restarts the animation when export is disabled 
    
  }
  delay(1000); //delays the sketch to enhance visibility, does not affect exported video  
  
  popMatrix();

}


String ran(){
  String s = int(random(10))+""+int(random(10))+""+int(random(10))+""+int(random(10));
  return s;
}

void mousePressed(){        
  if(exp){
    videoExport.endMovie();
  }
  exit();
  
}

void _triangle(int x, int y, color c, boolean mode){
  
  if (mode){
    fill(c);
    noStroke();
  } else {
    noFill();
    stroke(c);
  }
  triangle(x+-200,y+-30,x+-150,y+100,x+-100,y+-50);
  // you can create complex shapes by specifying points using the vertex(x,y)
  // uncomment code below see a custom shape
  /*
  beginShape();
  vertex(x+-50, y+10);
  vertex(x+-30, y+50);
  vertex(x+-40, y+70);
  vertex(x+-20, y+80);
  vertex(x+20, y+50);
  endShape(CLOSE);
  */
  
}

void _rectangle(int x, int y, color c, boolean mode){
  
  if (mode){
    fill(c);
    noStroke();
  } else {
    noFill();
    stroke(c);
  }
  rect(x+50,y+-150, 100, 60);
  
  
}

void _circle(int x, int y, color c, boolean mode){
  
  if (mode){
    fill(c);
    noStroke();
  } else {
    noFill();
    stroke(c);
  }
  circle(x+20,y+120, 100);
  
}
