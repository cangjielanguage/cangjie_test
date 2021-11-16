class moduleTest {
    static fromNow(module3) { 
      if (module3.num1 != 1 && module3.num2 != 2) {
        return "不是要我要的数字"
      }else{
      while(module3.num3<3){
        module3.num4 = module3.num4 + module3.num3
        module3.num3=module3.num3 + 1
      }
      return module3.num4.toString()
      }
    }
}

module.exports = function () {
    return moduleTest
}

