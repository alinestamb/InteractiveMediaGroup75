import controlP5.*;

ControlP5 cp5;

CreateSliders slider1;
CreateSliders slider2;
CreateSliders slider3;

SliderTitles slider1Title;
SliderTitles slider2Title;
SliderTitles slider3Title;

TextDisplay myText;
ImageLoad myImage;

Table xy;
int ytemp = 0;
String x = "";


public boolean isPlaying = false;


void setup(){
  size(1000,750);
  background(59,56,56);
  myText = new TextDisplay();
  myImage = new ImageLoad();
  
  xy = loadTable("/Users/LaraStamboulian/Downloads/InteractiveMediaGroup75-foundations (2)/InteractiveMediaGroup75-foundations/Foundation/temperature_3months.csv");
  for (int index = 0; index < xy.getRowCount(); index++) {
    // read the 2nd column (the 1), and read the row based on index which increments each draw()
    x = xy.getString(index, 0);
    ytemp = xy.getInt(index, 1); // index is the row, 1 is the column with the data.
    println(x+"," + ytemp);

  }
  
  
  //sliders:
  cp5 = new ControlP5(this);
  smooth(8);
  int sliderx = (int)(0.02*width);
  int slidery = (int)(0.18*height);
  int slideroffset = 90;
  println(sliderx);
  
  slider1 = new CreateSliders(cp5, "Temp Slider", sliderx, slidery, 150, 30);
  slider2 = new CreateSliders(cp5, "Air Quality Slider", sliderx, slidery+slideroffset, 150, 30);
  slider3 = new CreateSliders(cp5, "People Counter", sliderx, slidery+(2*slideroffset), 150, 30);
  
  slider1Title = new SliderTitles("Temp Slider", sliderx, slidery, 150, 30);
  slider2Title = new SliderTitles("Air Quality Slider", sliderx, slidery+slideroffset, 150, 30);
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
  myImage.imageload(imagex,imagey, imagew, imageh, ytemp);
   
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
