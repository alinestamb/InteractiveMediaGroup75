class CreateSliders {
  ControlP5 cp5;
  String title;
  Slider slider;
  int x, y, w, h;
  float min, max, value;
  
  CreateSliders(ControlP5 cp5, String title, int x, int y, int w, int h, float min, float max, float value) {
    this.cp5 = cp5;
    this.title = title;
    
    this.title = title;        
    this.x = x;        this.y = y;
    this.w = w;        this.h = h;
    this.min = min;    this.max = max;
    this.value = value;
    
    //HERE IS WHERE THE VALUES OF THE SLIDER WILL CHANGE, ACCORDING TO THE DATA SET.
    this.slider = cp5.addSlider(title).setPosition(x, y).setSize(w, h).setRange(min, max).setValue(value);
    
    //removing right text
    this.slider.setCaptionLabel(" ");
  }

  void display() {
    
    if (isPlaying==false){
    //DISABLE, change colour, lock value so it does not change
    slider.lock();
    slider.setColorBackground(backgroundcolour_disabled); 
    slider.setColorForeground(foregroundcolour_disabled); 
    } else   {
      slider.unlock();
      slider.setColorBackground(backgroundcolour_enabled); 
      slider.setColorForeground(foregroundcolour_enabled); 
    }
    
    //FOR TESTING, PRINT OUT THE VALUE OF THE FIRST SLIDER (TEMP) FOR ME
 //   println(tempslider.slider.getValue()); 
 }
}
