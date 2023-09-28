class TextDisplay {
  
  PFont myFont;
  
  float lineHeight = 20; 
  
  float marginLeft;
  float marginRight;
  
  //NEED TO FIGURE OUT MARGINS AND IT SHOULD WORK.
   
 void textdisplay(float marginLeft, float marginRight){
   
   String longText;
   
   if(isPlaying ==true ){
    longText = "See what changes! Pause to Enable.";
   } else{
     longText = "See what changes! Disabled when video starts playing.";
   }
   
   this.marginLeft = marginLeft;
   this.marginRight = marginRight;
    ////instruction text display
    fill(255);
    textAlign(LEFT);
    myFont = createFont("Segoe UI Light", 20);
    textFont(myFont);
    
    // split the long text into words
    String[] words = splitTokens(longText);
    float currentX = marginLeft;
    float currentY = lineHeight + 10; 
    
    //process each word to see where to move to new
    for (String word : words) {
      float wordWidth = textWidth(word + " ");
      if (currentX + wordWidth < width) {
        text(word + " ", currentX, currentY);
        currentX += wordWidth;
      } else {
        // Move to the next line
      currentX = marginLeft;
        currentY += lineHeight;
        text(word + " ", currentX, currentY);
        currentX += wordWidth;
      }
    }
  
  }
}
