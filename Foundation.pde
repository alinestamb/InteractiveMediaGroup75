import controlP5.*;
import beads.*;
import org.opencv.core.*;
import org.opencv.highgui.HighGui;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.imgproc.Imgproc;

ControlP5 cp5;
PImage img_foot;

CreateSliders tempslider;
CreateSliders peopleslider;

SliderTitles tempsliderTitle;
SliderTitles airqualitysliderTitle;
SliderTitles peoplesliderTitle;
SliderTitles volumesliderTitle;

TextDisplay myText;
ImageLoad myImage;
Audio_Air_Volume audioAirVol; // Added this line to create an instance of Audio_Air_Volumue
VariableStates myStates;

public float imagex = 0.28*1000;
public float imagey = 0.035*750;
public float imagew = 0.66*1000;
public float imageh = 0.49*750;

public int m = millis();

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

public float volumeValue = 0.5; // Initialize volume
public  float combinedValue = 0; // Combined slider value for frequency and reverb

public int sliderx = 20;
public int slidery = 160;
public int slideroffset = 90;

public color backgroundcolour_enabled = color(0,45,90,100);
public color foregroundcolour_enabled = color(0,116,217);
public color backgroundcolour_disabled = color(100, 100, 100, 100); 
public color foregroundcolour_disabled = color(164,158,158);

public color greencolour = color(60,250,83);
public color orangecolour = color (246,151,64);
public color redcolour = color (247,63,63);



void setup() {
  size(1000, 750);
  background(59, 56, 56);
  myText = new TextDisplay();
  myImage = new ImageLoad();

  // Sliders:
  cp5 = new ControlP5(this);
  smooth(8);
  
  //CHANGE 0 and 255 to the min and max pulled from the data!
  tempslider = new CreateSliders(cp5, "Temp Slider", sliderx, slidery, 150, 30,        0,255        ,0);
  peopleslider = new CreateSliders(cp5, "People Counter", sliderx, slidery+(2*slideroffset), 150, 30,        0,255        ,0);

  tempsliderTitle = new SliderTitles("Temp Slider", sliderx, slidery, 150, 30);
  peoplesliderTitle = new SliderTitles("People Counter", sliderx, slidery+(2*slideroffset), 150, 30);
  airqualitysliderTitle = new SliderTitles("Air Quality Slider", sliderx, slidery+slideroffset, 150, 30);
  volumesliderTitle = new SliderTitles("Volume", 360, slidery+(5*slideroffset), 200, 50);
 
  // Initialize Audio_Air_Volume
  audioAirVol = new Audio_Air_Volume();
  audioAirVol.audiosetup(cp5);
  
  myImage = new ImageLoad();
  
  myStates = new VariableStates();
  
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
   // yair = (int) yair;
    airValues.append(yair);
     
  }
  println("airValues loaded");
}

void draw() {
  // text:
  myText.textdisplay(width * 0.01);

  // Left sliders:
  tempslider.display();
  peopleslider.display();
  
  // black border:
  fill(0,0,0);
  rect(0.25*width,0.02*height,0.72*width,0.6*height);

  // image:
  myImage.imageload(imagex,imagey, imagew, imageh, tempValues, airValues);
  myImage.temp_blur();
 
  // placeholder rect's fill
  fill(255,255,255);

  // footsteps
  //rect(0.28*width,0.54*height,0.66*width,0.06*height);
  

  // variable states:
  // WILL USE INTERFASCIA FOR THIS, MOST LIKELY: a) if statements for benchmarks, display rect accordingly
  myStates.display();
  println(myStates.getTempFillColour());
  myStates.setTempFillColour(isPlaying);
  myStates.setAirQualityFillColour(isPlaying);
  myStates.setPeopleFillColour(isPlaying);
  
  
  // TO DO:
  // pause/play:
  rect(0.47*width,0.64*height,0.32*width,0.06*height);

  // timeframe: radiobuttons:
  // WILL USE INTERFASCIA, MOST LIKELY:
  rect(0.6*width,0.9*height,0.36*width,0.06*height);

  audioAirVol.setVolume((audioAirVol.volumeSlider.getValue()));
  audioAirVol.setCombinedValue((audioAirVol.combinedSlider.getValue()));
  
      if (isPlaying == false)    {
      audioAirVol.combinedSlider.lock();
      audioAirVol.combinedSlider.setColorBackground(backgroundcolour_disabled);
      audioAirVol.combinedSlider.setColorForeground(foregroundcolour_disabled);
      audioAirVol.Play_PauseButton.setColorBackground(backgroundcolour_disabled);
      audioAirVol.Play_PauseButton.setColorForeground(foregroundcolour_disabled);
            
     } else {
        audioAirVol.combinedSlider.unlock();
        audioAirVol.combinedSlider.setColorBackground(backgroundcolour_enabled);
        audioAirVol.combinedSlider.setColorForeground(foregroundcolour_enabled);
        audioAirVol.Play_PauseButton.setColorBackground(backgroundcolour_enabled);
        audioAirVol.Play_PauseButton.setColorForeground(foregroundcolour_enabled);
              }
              
              footstep_data();
  
}

void footstep_data(){
    m = 2;
    for (int i = 0; i < 10; i++) {
      println(peopleValues.get(i));
      //float value = 10;
     // for (int j=0; j<(value); j++) {
        addShoe();
      //}
    }
  }
   void addShoe() { 
    frameRate(10);
    int x = (int)random(0.28*width, 0.66*width+0.28*width);
    int y = (int)random(0.53*height, 0.06*height+0.53*height);
    //int i = x + width*y;
    img_foot = loadImage("data/Shoe.png");
    frameRate(3);
    noStroke();
   // color c = pixels[i];
    //fill(255);
    image(img_foot, x, y, 20, 20);
   // ellipse(x, y, 7, 7);
  }
  
  
void Play_Pause() {
  if (isPlaying) {
    audioAirVol.player.pause(true);
    isPlaying = false;
    println(volumeValue);
  } else {
    audioAirVol.player.pause(false);
    isPlaying = true;
  }
}

void stop() {
  // Stop the audio context when closing the sketch
  audioAirVol.ac.stop();
  super.stop();
}
