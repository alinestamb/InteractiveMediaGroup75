class DataLoad{
  int time_temp;
  int time_air;
  int time_people;
  int selection;
  
  int numcol;
  int numrow;
    
  //int[][] xytemp_table = new int[numrow][numcol];
  Table xytemp_table;
  Table xytemp;
  int temp_numRows;
  float [] tempArray={0.0,0.0,0.0};
  
    
  Table xyair_table;
  int air_numRows;
  float [] airArray ={0.0,0.0,0.0};
  
  Table xypeople_table;
  int people_numRows;
  float [] peopleArray ={0.0,0.0,0.0};
  
  void dataReaderTemp(Table xytemp, int selection){   // load the datasets onto here. Save the dataset into a useable array. 
    this.xytemp_table = xytemp;
    this.selection = selection;        // IF Selection .... CREATE NEW ARRAY, AND USE THAT ARRAY TO PASS THORUGH IMAGELOAD. this method will return an Array.
    temp_numRows = xytemp_table.getRowCount();
    tempArray = new float[temp_numRows];
     println(" temp done. Selection: ", selection);  
     for (int i = 0; i<temp_numRows;i++)
     {
       tempArray[i] = xytemp_table.getFloat(i,1);
       time_temp ++;
      }
    }
  
  void dataReaderAir(Table xyair, int selection){   // load the datasets onto here. Save the dataset into a useable array. 
    this.xyair_table = xyair;
    this.selection = selection;
    air_numRows = xyair.getRowCount();
    airArray = new float[air_numRows];
     println(" air done");  
     for (int i = 0; i<air_numRows;i++)
     {
       airArray[i] = xyair_table.getFloat(i,1);
       time_air ++;
      }
  }
  
  void dataReaderPeople(Table xypeople, int selection){   // load the datasets onto here. Save the dataset into a useable array. 
    this.xypeople_table = xypeople;
    this.selection = selection;
    people_numRows = xypeople_table.getRowCount();
    peopleArray = new float[people_numRows];
     println(" people done");  
     for (int i = 0; i<people_numRows;i++)
     {
       peopleArray[i] = xypeople_table.getFloat(i,1);
       time_people ++;
      }
  }
  
 int getTempNumRows(Table xytemp, int selection){   // load the datasets onto here. Save the dataset into a useable array. 
    this.xytemp_table = xytemp;
    this.selection = selection;
    temp_numRows = xytemp_table.getRowCount();
    return temp_numRows;
    }
    
    
  float getTempData(int time){
    this.time_temp = time;
    float tempdata = tempArray[time];
    return tempdata;
  
  }
  
  float  getAirData(int time){
     this.time_air = time;
     if (airArray.length == 0) {
      float airdata = airArray[time];
      return airdata;
     }
     else
     {
       dataReaderAir(xyair_table,2);
       return 0;
     }
  }
  
 float  getPeopleData(int time){
    this.time_people = time;
    if (peopleArray.length == 0){
       float peopledata = peopleArray[time];
       return peopledata;
    }
    else{
      dataReaderPeople(xypeople_table,2);
      return 0;
    }
  }
  
}
