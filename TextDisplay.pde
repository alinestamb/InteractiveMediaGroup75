class TextDisplay {
  
  int loopcounter = 0; 
  float lineHeight = 25 ;
  float marginLeft;
  String longText;
 
   
 void textdisplay(float marginLeft){
   
   //GET THIS IF STATEMENT TO UPDATE IN FOUNDATION
   println(isPlaying);
      if(isPlaying ==false ){
    longText = "See what changes! Pause VIDEO to Enable."; //6
   } else{
     longText = "See what changes! Disabled when VIDEO starts playing."; //8
   }
   
   this.marginLeft = marginLeft;

       
    ////instruction text display
    fill(255);
    textAlign(LEFT);
    textSize(16);
      
    // split the long text into words
    String[] words = splitTokens(longText);
    float currentX = marginLeft;
    float currentY = lineHeight + 10; 
  
    
    //process each word to see where to move to new
    for (String word : words ) {  
      if (loopcounter<24){
      float wordWidth = textWidth(word + " ");
        if (currentX + wordWidth < (width*0.25)) {
            text(word + " ", currentX, currentY);
            currentX += wordWidth;
          } else {
            // Move to the next line
            currentX = marginLeft;
            currentY += lineHeight;
            text(word + " ", currentX, currentY);
            currentX += wordWidth;
          }
          loopcounter +=1;
          
      } else {break;}
    }
  
  }
  

}
