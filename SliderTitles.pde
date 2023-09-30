class SliderTitles {
  ControlP5 cp5;
  String title;
  int x, y, w, h;
  
  SliderTitles(String title, int x, int y, int w, int h) {
    this.title = title;     
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
   
    fill(255);
    textSize(17);
    textAlign(LEFT);
    text(title, x , y-7);
   }

}
