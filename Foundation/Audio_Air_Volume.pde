class Audio_Air_Volume {
  AudioContext ac;
  SamplePlayer player;
  boolean isPlaying = true;
  float value = 0;
  
  color backcolour = backgroundcolour_enabled;
  color foregroundcolour = foregroundcolour_enabled;

  ControlP5 cp5;
  Button Play_PauseButton;
  Slider combinedSlider; // Combined slider for frequency and reverb
  Slider volumeSlider; // Volume slider

  Reverb reverb;
  Gain gainControl; // Declare the Gain UGen for controlling volume

  void audiosetup(ControlP5 cp5) {
    this.cp5 = cp5;
    // Initialize the audio context
    ac = new AudioContext();

    // Load your audio file
    Sample sample = null;
    try {
      sample = new Sample("/Users/AlineStamboulian/Downloads/soundtrack_2.wav");
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

    // Create a dynamic play/pause button
    Play_PauseButton = cp5.addButton("Play_Pause")
                       .setPosition(360+115, 0.9*height)
                       .setSize(100, 45)
                       .setValue(0)
                       .setCaptionLabel(" ")
                       .setColorBackground(backgroundcolour_enabled)
                       .setColorForeground(foregroundcolour_enabled);
               
                       //for play button, x:565 y:480, width:150 height:45
    //Label:
    
    fill(255);
    textSize(17);
    textAlign(LEFT);
    text("START/STOP", 360, 0.92*height);
    text("Music", 360,0.95*height);
          
          
          
    // Create a combined slider
    combinedSlider = cp5.addSlider("setCombinedValue")
                      .setPosition(sliderx, slidery+slideroffset)
                      .setSize(150, 30)
                      .setRange(0.0, 2.0) // Set the range for both parameters
                      .setValue(combinedValue) // Initialize the combined slider value
                      .setCaptionLabel(" ")
                      .setColorBackground(backgroundcolour_enabled)
                      .setColorForeground(foregroundcolour_enabled);

    // Create a volume slider
    volumeSlider = cp5.addSlider("setVolume")
                    .setPosition(360, slidery+(5*slideroffset))
                    .setSize(200, 45)
                    .setRange(0.0, 1.0) // Set the volume range (0.0 to 1.0)
                    .setValue(volumeValue)// Initialize volume
                    .setCaptionLabel(" ")
                    .setColorBackground(backgroundcolour_enabled)
                    .setColorForeground(foregroundcolour_enabled);
}

  void setCombinedValue(float value) {
    combinedValue = value;

    // Separate the combined slider value into frequency and reverb wetness
    float frequencyValue = map(value, 0.0, 2.0, 1, 2);
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
  
  
  void controlEvent(ControlEvent event) {
     if (event.isController() && event.getName().equals("setCombinedValue")){   
        setCombinedValue(event.getValue());
        } else if (event.isController() && event.getName().equals("setVolume")){
          setVolume(event.getValue());           
        } 
  }
}
