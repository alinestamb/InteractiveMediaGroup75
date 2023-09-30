class CreateSliders {
  ControlP5 cp5;
  String title;
  Slider slider;
  int x, y, w, h;
  
  CreateSliders(ControlP5 cp5, String title, int x, int y, int w, int h) {
    this.cp5 = cp5;
    this.title = title;
    
    //to remove the titles on the right of the slider, make title spaces.
      if (title == "Temp Slider")
      {
        fill(59,56,56);
        title = " ";
      } else if (title == "Air Quality Slider")
      {
        fill(59,56,56);
        title = "  ";
      } else {
        fill(59,56,56);
        title = "   ";
      }
      
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    //HERE IS WHERE THE VALUES OF THE SLIDER WILL CHANGE, ACCORDING TO THE DATA SET.
    this.slider = cp5.addSlider(title).setPosition(x, y).setSize(w, h).setRange(0, 255);
  }

  void display() {
    
    if (isPlaying==true){
    //DISABLE, change colour, lock value so it does not change
    slider.lock();
    slider.setColorBackground(color(100, 100, 100, 100));         
    }
    
    //FOR TESTING, PRINT OUT THE VALUE OF THE FIRST SLIDER (TEMP) FOR ME
    println(slider1.slider.getValue()); }}
