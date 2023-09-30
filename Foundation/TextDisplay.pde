class TextDisplay {
  
  int loopcounter = 0; 
  float lineHeight = 25 ;
  float marginLeft = width * 0.2;
  
  //NEED TO FIGURE OUT MARGINS AND IT SHOULD WORK.
   
 void textdisplay(float marginLeft){
   
   String longText;
   
   if(isPlaying ==true ){
    longText = "See what changes! Pause to Enable."; //6
   } else{
     longText = "See what changes! Disabled when video starts playing."; //8
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
