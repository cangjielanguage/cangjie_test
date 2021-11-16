class moduleTest {
    obj =new Object()
    static fromNow(module10) { 
      if (module10.num != 3 || module10.en.name!="object10") {
        return [module10.num3]
      }
      if(module10.num2 !=4  || module10.num3 !=5){
        return [module10.num2]
      }
      return [module10.num]
    }
}

module.exports = function () {
    return moduleTest
}

