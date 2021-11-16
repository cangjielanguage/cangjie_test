isMoment=function(module9) { 
  if (module9.num1 != 1 || module9.Tu[1]!=2) {
    return function(x){return x.toString() }
  }
  while(module9.num3<4){
    module9.num2=module9.num2 + module9.num3
    module9.num3 = module9.num3 + 1
  }
  return function(x){return x.toString() + x.toString()}
}

module.exports = {
    isMoment
}
