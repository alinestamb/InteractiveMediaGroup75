class ImageLoad{
  float imgx;
  float imgy;
  float imgw;
  float imgh;
  int ytemparray;
  // flat get temperature value
  
 void imageload(float imgx, float imgy, float imgw, float imgh, int ytemp){
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
     colorMode(HSB);
           frameRate(50); frameRate(0.0000001);
      // println("something");
    // for (int i = 0; i < ytemparray.length; i++){
     if (ytemp ==18)
     {
       tint(240,100,200);
      // println(ytemparray[i]);
     }
     
     if (ytemp ==19)
     {
       tint(200,100,200);
    //   println(ytemparray[i]);
     }
     
     if (ytemp==20)
     {
       tint(150,100,200);
     //  println(ytemparray[i]);
     }
     
     if (ytemp ==21)
     {
       tint(120,100,200);
      // println(ytemparray[i]);
     }
     if (ytemp ==22)
     {
       tint(80,100,200);
      // println(ytemparray[i]);
     }
     if (ytemp ==23)
     {
       tint(50,100,200);
       //println(ytemparray[i]);
     }
     if (ytemp ==24)
     {
       tint(350,100,200);
//println(ytemparray[i]);
     }
    }

  // }
      

}
