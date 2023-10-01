class SliderTitles {
  ControlP5 cp5;
  String title ;
  int x, y, w, h, align;
  
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
   
    SliderTitles(String title, int x, int y, int w, int h, int align ) {
    this.title = title;     
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.align = align;
   
    fill(255);
    textSize(17);
    textAlign(RIGHT);
    text(title, x , y);
   }

}
