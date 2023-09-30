class ImageLoad{
  float imgx;
  float imgy;
  float imgw;
  float imgh;
  
  
 void imageload(float imgx, float imgy, float imgw, float imgh){
     this.imgx = imgx;
     this.imgy = imgy;
     this.imgw = imgw;
     this.imgh = imgh;
     int imgw_int = (int) imgw;
     int imgh_int = (int)imgh;
     PImage img = loadImage("UTS.png"); 
     img.resize(imgw_int,imgh_int);
     image(img,imgx,imgy);
     
     //We'll write image blurry function here, and call it in foundation
     //Right now, the image is loading as an image, rather than pixels. 
     //To consider changing this when coding for blurriness, to have a better effect.
      
}
}
