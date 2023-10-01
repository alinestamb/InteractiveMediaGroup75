import controlP5.*;
import beads.*;

ControlP5 cp5;
PImage img_foot;

CreateSliders tempslider;
CreateSliders peopleslider;

SliderTitles tempsliderTitle;
SliderTitles airqualitysliderTitle;
SliderTitles peoplesliderTitle;
SliderTitles volumesliderTitle;

SliderTitles tempstateTitle;
SliderTitles airstateTitle;
SliderTitles peoplestateTitle;

DataLoad myData;
TextDisplay myText;
ImageLoad myImage;
Audio_Air_Volume audioAirVol; // Added this line to create an instance of Audio_Air_Volumue
VariableStates myStates;


public float imagex = 0.28*1000;
public float imagey = 0.035*750;
public float imagew = 0.66*1000;
public float imageh = 0.49*750;

public Table xytemp;
public IntList tempValues;
public Table xypeople;
public IntList peopleValues;
public Table xyair;
public FloatList airValues;
public int selection = 2; //CHANGE WHEN THE TIME FRAME SELECTION CHANGES. 1WK - 0; 1MTH - 1; 3MTHS - 2  

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

public int counter;

public float tempdata=0;
public float airdata  = 0;
public float peopledata = 0;




//public Table xytemp;
//public Table xyair;
//public Table xypeople;

void setup() {
  size(1000, 750);
  background(59, 56, 56);
  myText = new TextDisplay();
  myImage = new ImageLoad();

  // Sliders:
  cp5 = new ControlP5(this);
  smooth(8);
  
  
   xytemp = loadTable("data/temperature_3months.csv");
 println("loaded temp table");
 
 xyair = loadTable("data/airQuality_3months.csv");
 println("loaded air table");
 
 xypeople = loadTable("data/people_counter_3months.csv");
 println("loaded people table");
 
 myData = new DataLoad(); 
  
  //CHANGE 0 and 255 to the min and max pulled from the data!
  tempslider = new CreateSliders(cp5, "Temp Slider", sliderx, slidery, 150, 30,18.87097, 24.03226,tempdata);
  peopleslider = new CreateSliders(cp5, "People Counter", sliderx, slidery+(2*slideroffset), 150, 30,1,48,peopledata);

  tempsliderTitle = new SliderTitles("Temp Slider", sliderx, slidery, 150, 30);
  peoplesliderTitle = new SliderTitles("People Counter", sliderx, slidery+(2*slideroffset), 150, 30);
  airqualitysliderTitle = new SliderTitles("Air Quality Slider", sliderx, slidery+slideroffset, 150, 30);
  volumesliderTitle = new SliderTitles("Volume", 360, slidery+(5*slideroffset), 200, 50);
  
  tempstateTitle = new SliderTitles("Temp State", ((sliderx+50)*3) - 32, slidery+385, 150, 30,0);
  airstateTitle = new SliderTitles("Air Quality State", ((sliderx+50)*3) - 32, slidery+435, 150, 30,0);
  peoplestateTitle = new SliderTitles("People State", ((sliderx+50)*3) - 32, slidery+485, 150, 30,0);
  
 
  // Initialize Audio_Air_Volume
  audioAirVol = new Audio_Air_Volume();
  audioAirVol.audiosetup(cp5);
  
  myImage = new ImageLoad();
  
  myStates = new VariableStates();


  

}

void draw() { 
  myData.dataReaderTemp (xytemp, selection);
  myData.dataReaderAir (xyair, selection);
  myData.dataReaderPeople (xypeople, selection);
 
  int sliderValue_temp = 0;
  int sliderValue_air = 0;  
  int sliderValue_people = 0;
  
  tempdata = myData.getTempData(sliderValue_temp);
  airdata = myData.getAirData(sliderValue_air);
  peopledata = myData.getPeopleData(sliderValue_people);
  
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
 
  // variable states:
  // WILL USE INTERFASCIA FOR THIS, MOST LIKELY: a) if statements for benchmarks, display rect accordingly
  myStates.display();
  println(myStates.getTempFillColour());
  myStates.setTempFillColour(isPlaying);
  myStates.setAirQualityFillColour(isPlaying);
  myStates.setPeopleFillColour(isPlaying);
  
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
    for (int i = 0; i < 10; i++) {
   //   println(peopleValues.get(i));
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
    frameRate(300);
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

//SELECT TIME FRAME AND CREATE AN ARRAY ?
 //tempdata = myData.getTempData(sliderValue_temp);
 // airdata = myData.getAirData(sliderValue_air);
 // peopledata = myData.getPeopleData(sliderValue_people);
