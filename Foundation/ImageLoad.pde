class ImageLoad {
  float imgx;
  float imgy;
  float imgw;
  float imgh;
  //int ytemparray;
  // float/int get temperature value



  void imageload(float imgx, float imgy, float imgw, float imgh, IntList tempValues, FloatList airValues){
    this.imgx = imgx;
    this.imgy = imgy;
    this.imgw = imgw;
    this.imgh = imgh;
    int imgw_int = (int) imgw;
    int imgh_int = (int)imgh;



    PImage img = loadImage("UTS.png");
    img.resize(imgw_int,imgh_int);

    image(img, imgx, imgy);
    // blur = loadShader("blur.glsl");
    //  filter(BLUR,1);
    //We'll write image blurry function here, and call it in foundation
    //Rightnow, the image is loading as an image, rather than pixels. 
    //To consider changing this when coding for blurriness, to have a better effect.
    noStroke();
    loadPixels(); 


    for (int i = 0; i <airValues.size(); i++) {
      float value = airValues.get(i);
      float multiplier = 1000000;
      for (int j=0; j<(value*multiplier); j++) {
        addPoint();
      }
    }



    colorMode(HSB);
    // println("something");
    for (int i = 0; i < tempValues.size(); i++) {
      println("tempValues: "+tempValues.get(i));
      if (tempValues.get(i) ==18)
      {
        tint(240, 100, 200);
        // println(ytemparray[i]);
      }

      if (tempValues.get(i) ==19)
      {
        tint(200, 100, 200);
        //   println(ytemparray[i]);
      }

      if (tempValues.get(i)==20)
      {
        tint(150, 100, 200);
        //  println(ytemparray[i]);
      }

      if (tempValues.get(i) ==21)
      {
        tint(120, 100, 200);

        // println(ytemparray[i]);
      }
      if (tempValues.get(i) ==22)
      {
        tint(80, 100, 200);
        // println(ytemparray[i]);
      }
      if (tempValues.get(i)==23)
      {
        tint(50, 100, 200);
        //println(ytemparray[i]);
      }
      if (tempValues.get(i) ==24)
      {
        tint(
          // Add a random filled circle to image
          350, 100, 200);
        //println(ytemparray[i]);
      }
    }
  }

  //  int DELAY_BLUR = 100;
  //  int MAX_KERNEL_LENGTH = 31;
  //  Mat src = new Mat();
  //  Mat dst = new Mat();

  //void blur(String value[]) {
  //  System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
  //  String filename = "/Users/LaraStamboulian/Downloads/InteractiveMediaGroup75-foundations (2)/InteractiveMediaGroup75-foundations/Foundation/UTS.png";
  //  src = Imgcodecs.imread(filename, Imgcodecs.IMREAD_COLOR);

  //  for( int i = 1; i<MAX_KERNEL_LENGTH; i = i+2){
  //    Imgproc.blur(src, dst, new Size(i,i), new Point(-1,-1);

  //    displayDst(DELAY_BLUR);
  //  }


  //  }



  void addPoint() { 
    int x = (int)random(imgx, imgw+imgx);
    int y = (int)random(imgy, imgh+imgy);
    int i = x + width*y;
    color c = pixels[i];
    fill(c);
    ellipse(x, y, 7, 7);
  }
}
