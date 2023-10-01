class ImageLoad{
  float imgx;
  float imgy;
  float imgw;
  float imgh;
  IntList tempValues;
  FloatList airValues;
  int counter;
  float [] tempNewArray;
  
   DataLoad myData;
  
 void imageload(float imgx, float imgy, float imgw, float imgh,IntList tempValues, FloatList airValues){
    myData = new DataLoad(); 
    
     this.imgx = imgx;
     this.imgy = imgy;
     this.imgw = imgw;
     this.imgh = imgh;
     this.tempValues = tempValues;
     this.airValues = airValues;
     int imgw_int = (int) imgw;
     int imgh_int = (int)imgh;
     
     PImage img = loadImage("data/UTS.png"); 
     img.resize(imgw_int,imgh_int);
     
     image(img,imgx,imgy);
     loadPixels();
    
 }
 
  int temp_blur(){ 
        for (int i = 0; i <myData.getAirData(i); i++) {
          float value = 5;
          float multiplier = 1000000;
          for (int j=0; j<(value*multiplier); j++) {
            addPoint();        }
          }
    colorMode(HSB);
    


    
    int num = myData.getTempNumRows(xytemp,selection);
   
    for (int i = 0; i < num; i++) {
      
      float tempData =  myData.getTempData(num);
      tempNewArray[i] = tempData;
      
     // println("tempValues: "+tempValues.get(i));
      if (tempData == 18)
      { tint(240, 100, 200);          }
      if (tempData==19)
      { tint(200, 100, 200);          }
      if (tempData==20)
      { tint(150, 100, 200);          }
      if (tempData ==21)
      {
       // tint(120, 100, 200);
        tint( 350, 100, 200);         }
      if (tempData ==22)
      { tint(80, 100, 200);           }
      if (tempData==23)
      { tint(50, 100, 200);           }
      if (tempData ==24)
      {tint(350, 100, 200);             }
    }
    return counter;
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
