import controlP5.*;
import beads.*;

ControlP5 cp5;

CreateSliders tempslider;
CreateSliders peopleslider;

SliderTitles tempsliderTitle;
SliderTitles airqualitysliderTitle;
SliderTitles peoplesliderTitle;
SliderTitles volumesliderTitle;

TextDisplay myText;
ImageLoad myImage;

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

Audio_Air_Volume audioAirVol; // Added this line to create an instance of Audio_Air_Volumeume

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
  float imagex = 0.28*width;
  float imagey = 0.04*height;
  float imagew = 0.66*width;
  float imageh = 0.49*height;
  myImage.imageload(imagex,imagey, imagew, imageh);

  // placeholder rect's fill
  fill(255,255,255);

  // footsteps
  rect(0.28*width,0.54*height,0.66*width,0.06*height);

  // variable states:
  // WILL USE INTERFASCIA FOR THIS, MOST LIKELY: a) if statements for benchmarks, display rect accordingly
  fill(112,173,71);
  rect(0.04*width,0.65*height,0.25*width,0.25*height);
  fill(255,255,255);

  // TO DO:
  // pause/play:
  rect(0.47*width,0.64*height,0.32*width,0.06*height);



  // timeframe: radiobuttons:
  // WILL USE INTERFASCIA, MOST LIKELY:
  rect(0.6*width,0.9*height,0.36*width,0.06*height);

  audioAirVol.setVolume((audioAirVol.volumeSlider.getValue()));
  audioAirVol.setCombinedValue((audioAirVol.combinedSlider.getValue()));
  
  //Start / Stop Music Label:
  
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
  
}

void Play_Pause() {
  if (isPlaying) {
    audioAirVol.player.pause(true);
    isPlaying = false;
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
