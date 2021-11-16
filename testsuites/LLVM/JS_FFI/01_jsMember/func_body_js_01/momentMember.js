var isMoment=function(x,z,y){
      while(z>1){
        y+=z;
        z--;
      }
      return x + y + z
  }

module.exports =  {
    isMoment
}