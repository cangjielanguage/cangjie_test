class moduleTest {
    static fromNow(module4) { 
      if (module4.num1 != 1 || module4.num2 != 2) {
        return true
      }else{
        while(module4.num3<3){
          module4.num4 = module4.num4 + module4.num3
          module4.num3=module4.num3 + 1
        }
      }
      if(module4.num4!=6 || module4.fun(0) != 0){
        return true
      }else{
        return false
      }
    }
}

module.exports = function () {
    return moduleTest
}


