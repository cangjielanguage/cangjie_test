isMoment=function(module2) { 
  if (module2.str != "true" || module2.chr != 't') {
      return 1
  }
  if (module2.num != 0 || module2.num2 != 0) {
      return 1
  }
  return 0
}


module.exports ={
    isMoment
}