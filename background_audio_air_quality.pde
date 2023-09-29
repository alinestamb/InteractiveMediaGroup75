import beads.*;
import controlP5.*;

AudioContext ac;
SamplePlayer player;
float volumeValue = 0.5; // Initialize volume
float combinedValue = 1.0; // Combined slider value for frequency and reverb
boolean isPlaying = true;

ControlP5 cp5;
Slider combinedSlider; // Combined slider for frequency and reverb
Slider volumeSlider; // Volume slider

Reverb reverb;

Gain gainControl; // Declare the Gain UGen for controlling volume

void setup() {
  size(400, 200);
  background(255);

  // Initialize the audio context
  ac = new AudioContext();

  // Load your audio file
  Sample sample = null;
  try {
    sample = new Sample("/Users/charlizeschool/Documents/Processing/assignment/soundtrack.wav");
  } catch (Exception e) {
    e.printStackTrace();
    exit();
  }

  // Create a SamplePlayer
  player = new SamplePlayer(ac, sample);

  // Create a Gain object to control the player's gain
  gainControl = new Gain(ac, 1, volumeValue); // Initialize volume

  // Connect the player to the gain control
  gainControl.addInput(player);

  // Add the gain control to the audio context
  ac.out.addInput(gainControl);

  // Create a reverb effect
  reverb = new Reverb(ac);

  // Connect the gain control to the reverb
  reverb.addInput(gainControl);

  // Add the reverb to the audio context
  ac.out.addInput(reverb);

  // Start playing the audio
  ac.start();
  player.start();

  // Create ControlP5 instance
  cp5 = new ControlP5(this);
  
 //slider lablels 
  cp5.addTextlabel("distortionLabel")
     .setPosition(10, 50)
     .setColor(color(0))
     .setValue("Air Quality");
    
  cp5.addTextlabel("volumeLabel")
   .setPosition(10, 90)
   .setColor(color(0))
   .setValue("Volume");
  
  
  // Create a dynamic play/pause button
  cp5.addButton("playPause")
     .setPosition(10, 10)
     .setSize(80, 30)
     .setValue(0);

  // Create a combined slider
  combinedSlider = cp5.addSlider("setCombinedValue")
                    .setPosition(10, 60)
                    .setSize(200, 20)
                    .setRange(0.0, 2.0) // Set the range for both parameters
                    .setValue(combinedValue); // Initialize the combined slider value

  // Create a volume slider
  volumeSlider = cp5.addSlider("setVolume")
                  .setPosition(10, 100)
                  .setSize(200, 20)
                  .setRange(0.0, 1.0) // Set the volume range (0.0 to 1.0)
                  .setValue(volumeValue); // Initialize volume
}

void draw() {
}

void playPause() {
  if (isPlaying) {
    player.pause(true);
    isPlaying = false;
  } else {
    player.pause(false);
    isPlaying = true;
  }
}

void setCombinedValue(float value) {
  combinedValue = value;

  // Separate the combined slider value into frequency and reverb wetness
  float frequencyValue = map(value, 0.0, 2.0, 0.5, 2.0);
  float reverbWetness = map(value, 0.0, 2.0, 0.0, 1.0);

  // Set the rate of the SamplePlayer using the calculated frequency
  Static staticUGen = new Static(ac, frequencyValue);
  player.setRate(staticUGen);

  // Set the reverb wetness
  reverb.setDamping(reverbWetness);
}

void setVolume(float value) {
  // Set the volume using the volume slider
  volumeValue = value;
  gainControl.setGain(volumeValue);
}

void stop() {
  // Stop the audio context when closing the sketch
  ac.stop();
  super.stop();
}
