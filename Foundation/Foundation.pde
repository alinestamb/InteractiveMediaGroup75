import controlP5.*;
import org.opencv.core.*;
import org.opencv.highgui.HighGui;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.imgproc.Imgproc;

ControlP5 cp5;

//PShader blur;
CreateSliders slider1;
CreateSliders slider2;
CreateSliders slider3;

SliderTitles slider1Title;
SliderTitles slider2Title;
SliderTitles slider3Title;

TextDisplay myText;
ImageLoad myImage;

Table xytemp;
int ytemp = 0;
String xtemp = "";
IntList tempValues;


Table xypeople;
int ypeople = 0;
String xpeople = "";
IntList peopleValues;

Table xyair;
float yair = 0;
String xair = "";
FloatList airValues;
// array for air quality values
// change air quality to air pollution wording

public boolean isPlaying = false;


void setup(){
  size(1000,750);
  background(59,56,56);
  myText = new TextDisplay();
  myImage = new ImageLoad();
  
  //xytemp1 = loadTable("data/people_counter_3months.csv");


  
  
  xytemp = loadTable("data/temperature_3months.csv");
   tempValues = new IntList();
  for (int index = 0; index < xytemp.getRowCount(); index++) {
    // read the 2nd column (the 1), and read the row based on index which increments each draw()
    xtemp = xytemp.getString(index, 0);
    ytemp = xytemp.getInt(index, 1); // index is the row, 1 is the column with the data.
   // println(xtemp+"," + ytemp);
    tempValues.append(ytemp);
  }
  println("temperature loaded");
  
  
   xypeople = loadTable("data/people_counter_3months.csv");
   peopleValues = new IntList();
  for (int index = 0; index < xypeople.getRowCount(); index++) {
    // read the 2nd column (the 1), and read the row based on index which increments each drements each draw()
    xpeople = xypeople.getString(index, 0);
    ypeople = xypeople.getInt(index, 1); // index is the row, 1 is the column with the data.
    //  println(xair+"," + yair);
    peopleValues.append(ypeople);
  }
  println("people counter loaded");
  
  
  xyair = loadTable("data/airQuality_3months.csv");
   airValues = new FloatList();
  for (int index = 0; index < xyair.getRowCount(); index++) {
    // read the 2nd column (the 1), and read the row based on index which increments each drements each draw()
    xair = xyair.getString(index, 0);
    yair= xyair.getFloat(index, 1); // index is the row, 1 is the column with the data.
    //  println(xair+"," + yair);
    airValues.append(yair);
  }
  println("airValues loaded");
  
 
  
  
  
  //sliders:
  cp5 = new ControlP5(this);
  smooth(8);
  int sliderx = (int)(0.02*width);
  int slidery = (int)(0.18*height);
  int slideroffset = 90;
  println("sliderx: "+sliderx);
  
  slider1 = new CreateSliders(cp5, "Temp Slider", sliderx, slidery, 150, 30);
slider2 = new CreateSliders(cp5, "Air Pollution Slider", sliderx, slidery+slideroffset, 150, 30);
  slider3 = new CreateSliders(cp5, "People Counter", sliderx, slidery+(2*slideroffset), 150, 30);
  
  slider1Title = new SliderTitles("Temp Slider", sliderx, slidery, 150, 30);
  slider2Title = new SliderTitles("Air Pollution Slider", sliderx, slidery+slideroffset, 150, 30);
  slider3Title = new SliderTitles("People Counter", sliderx, slidery+(2*slideroffset), 150, 30);
}

void draw(){
  
  // text:
  myText.textdisplay(width * 0.01);
    
  //sliders:
  slider1.display();
  slider2.display();
  slider3.display();
  
  //black border:
  fill(0,0,0);
  rect(0.25*width,0.02*height,0.72*width,0.6*height);
  
  //image:
  float imagex = 0.28*width;
  float imagey = 0.04*height;
  float imagew = 0.66*width;
  float imageh = 0.49*height;
    
  myImage.imageload(imagex,imagey, imagew, imageh, tempValues, airValues);
 
  //placeholder rect's fill
  fill(255,255,255);
  
  //footsteps
  rect(0.28*width,0.54*height,0.66*width,0.06*height);
  
  //variable states:
  //WILL USE INTERFASCIA FOR THIS, MOST LIKELY:
  fill(112,173,71);
  rect(0.04*width,0.65*height,0.25*width,0.25*height);
  fill(255,255,255);    
  
  //TO DO:
  //pause/play:
  rect(0.47*width,0.64*height,0.32*width,0.06*height);
  
  //volume:
  rect(0.32*width,0.9*height,0.26*width,0.06*height);
  
  //timeframe: radiobuttons:
  //WILL USE INTERFASCIA, MOST LIKELY:
  rect(0.6*width,0.9*height,0.36*width,0.06*height);
  
  
  
     
}
