class VariableStates{

 color tempfillcolour = redcolour;
 color airqualityfillcolour = orangecolour;
 color peoplefillcolour = greencolour;
 
 boolean isPlaying;
 
 int huecolour = 255;
 int rectoffset = 10;
 float rectwidth = 0.05*width;
 float rectheight = 0.05*height;
 float rectx = 0.2*width;
 float recty = 0.7*height;

  void display(){
 
  hue(getHueColour());
  fill(getTempFillColour());
  rect(rectx,recty,rectwidth, rectheight);
  
  fill(getAirQualityFillColour());
  rect(rectx,recty + rectheight + rectoffset ,rectwidth, rectheight);
  
  fill(getPeopleFillColour());
  rect(rectx,recty + 2*(rectheight+rectoffset),rectwidth, rectheight);
  
  }
  
  ////Setter+Getter for Temp Colour
  void setTempFillColour(boolean isPlaying){
    this.isPlaying = isPlaying;
    if (isPlaying ==true){
      tempfillcolour = redcolour;
    } else {
        tempfillcolour = greencolour;
      }  
  }
  color getTempFillColour()  {
    return tempfillcolour;       }   
    
  ////Setter+Getter for Air Colour
  void setAirQualityFillColour(boolean isPlaying){
    this.isPlaying = isPlaying;
    if (isPlaying ==true){
      airqualityfillcolour = greencolour;
    } else {
        airqualityfillcolour = orangecolour;
      }  
  }    
  color getAirQualityFillColour()  {
    return airqualityfillcolour;       }
 
 
 ////Setter+Getter for People Colour
   void setPeopleFillColour(boolean isPlaying){
    this.isPlaying = isPlaying;
    if (isPlaying ==true){
      peoplefillcolour = orangecolour;
    } else {
        peoplefillcolour = redcolour;
      }  
  }    
  color getPeopleFillColour()  {
    return peoplefillcolour;       }  
  
  
  
  ////Setter+Getter for Hue Colour
  int getHueColour()  {
    return huecolour;      }
   
}
