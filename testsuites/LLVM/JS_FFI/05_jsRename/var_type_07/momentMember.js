function isMoment(module7) { 
  if (module7.str!="object7" || module7.num!= 7  ) {
    return 1
  }
  if(module7.fun(4)!="4" || module7.un!=undefined){
    return 1
  }
  return module7.un
}


module.exports = {
    isMoment
}

