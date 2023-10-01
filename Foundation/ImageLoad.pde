class ImageLoad{
  float imgx;
  float imgy;
  float imgw;
  float imgh;
  IntList tempValues;
  FloatList airValues;
  
 void imageload(float imgx, float imgy, float imgw, float imgh,IntList tempValues, FloatList airValues){
     this.imgx = imgx;
     this.imgy = imgy;
     this.imgw = imgw;
     this.imgh = imgh;
     this.tempValues = tempValues;
     this.airValues = airValues;
     int imgw_int = (int) imgw;
     int imgh_int = (int)imgh;
     
     PImage img = loadImage("UTS.png"); 
     img.resize(imgw_int,imgh_int);
     
     image(img,imgx,imgy);
     loadPixels();
    
     //We'll write image blurry function here, and call it in foundation
     //Right now, the image is loading as an image, rather than pixels. 
     //To consider changing this when coding for blurriness, to have a better effect.
 }
void temp_blur(){
    m = 2;
    for (int i = 0; i <5; i++) {
      float value = airValues.get(i);
      float multiplier = 1000000;
      for (int j=0; j<(value*multiplier); j++) {
        addPoint();
      }
    }

    colorMode(HSB);
    // println("something");
    for (int i = 0; i < tempValues.size(); i++) {
     // println("tempValues: "+tempValues.get(i));
      if (tempValues.get(i) ==18)
      {
        tint(240, 100, 200);          }

      if (tempValues.get(i) ==19)
      {
        tint(200, 100, 200);          }

      if (tempValues.get(i)==20)
      {
        tint(150, 100, 200);          }

      if (tempValues.get(i) ==21)
      {
       // tint(120, 100, 200);
        tint( 350, 100, 200);         }
      if (tempValues.get(i) ==22)
      {
        tint(80, 100, 200);           }
      if (tempValues.get(i)==23)
      {
        tint(50, 100, 200);           }
      if (tempValues.get(i) ==24)
      {
        tint(
          // Add a random filled circle to image
          350, 100, 200);             }
    }
  }
 

 //blurriness
  void addPoint() { 
    frameRate(10);
    int x = (int)random(0.28*10000, imagew+imagex);
    int y = (int)random(imagey, imageh+imagey);
    int i = x + width*y;
    noStroke();
    color c = pixels[i];
    fill(c);
    ellipse(x, y, 7, 7);
  }
}
