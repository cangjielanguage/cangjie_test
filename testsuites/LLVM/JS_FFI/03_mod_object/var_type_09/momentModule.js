class moduleTest {
    static fromNow=function(module9) { 
      if (module9.num1 != 1 ) {
        return function(x){return x.toString() }
      }
      while(module9.num3<4){
        module9.num2=module9.num2 + module9.num3
        module9.num3 = module9.num3 + 1
      }
      console.log(module9.num2)
      console.log(module9.num3)
      return function(x){return x.toString() + x.toString()}
    }
}

module.exports = function () {
    return moduleTest
}

