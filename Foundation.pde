import controlP5.*;

ControlP5 cp5;

CustomSlider slider1;
CustomSlider slider2;
CustomSlider slider3;

TextDisplay myText;
ImageLoad myImage;

public boolean isPlaying = false;



void setup(){
  size(1000,750);
  background(59,56,56);
  myText = new TextDisplay();
  myImage = new ImageLoad();
  
  //sliders:
  cp5 = new ControlP5(this);
  smooth(8);
  int sliderx = (int)(0.02*width);
  int slidery = (int)(0.18*height);
  int slideroffset = 90;
  println(sliderx);
  
  
  slider1 = new CustomSlider(cp5, "Temp Slider", sliderx, slidery, 150, 30);
  slider2 = new CustomSlider(cp5, "Air Quality Slider", sliderx, slidery+slideroffset, 150, 30);
  slider3 = new CustomSlider(cp5, "People Counter", sliderx, slidery+(2*slideroffset), 150, 30);
  
     
}

void draw(){
  
  fill(59,56,56);
  // text:
  //rect(0.01*width,0.02*height,0.22*width,0.15*height);
  //myText.textdisplay(0.01*width, 0.02*height);
  myText.textdisplay(width * 0.01, height * 0.9);

  

  //3 sliders:

 
    slider1.display();
    slider2.display();
    slider3.display();
      
  
  //black border:
  fill(0,0,0);
  rect(0.25*width,0.02*height,0.72*width,0.6*height);
  fill(255,255,255);
  
  
  //image:
  fill(62,75,107);
   float imagex = 0.28*width;
   float imagey = 0.04*height;
   float imagew = 0.66*width;
   float imageh = 0.49*height;
  rect(0.28*width,0.04*height,0.66*width,0.49*height);
  fill(255,255,255);
  
   myImage.imageload(imagex,imagey, imagew, imageh);
  
  //footsteps
  //CHARLIZE AND CHRISTINES
  rect(0.28*width,0.54*height,0.66*width,0.06*height);
  
  
  //variable states:
  //WILL USE INTERFASCIA FOR THIS:
  fill(112,173,71);
  rect(0.04*width,0.65*height,0.25*width,0.25*height);
  fill(255,255,255);
    
  
  //TO DO:
  //pause/play:
  rect(0.47*width,0.64*height,0.32*width,0.06*height);
  
  //volume:
  rect(0.32*width,0.9*height,0.26*width,0.06*height);
  
  
  //timeframe: radiobuttons:
  //WILL USE INTERFASCIA:
  rect(0.6*width,0.9*height,0.36*width,0.06*height);
}
