class LineGroup {
  ArrayList<Lines> lineSwarm;
  
  LineGroup()
  {
    lineSwarm = new ArrayList<Lines>();
  }
  
  void run()
  {
    for(Lines l : lineSwarm){
      l.run(lineSwarm);  
    }
  }
  
  void addLine(Lines l)
  {
    lineSwarm.add(l);
  }
}

