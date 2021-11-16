//let fun=function(x){return x}

class moduleTest {
    static fromNow(module1) { 
      if (module1.bo || module1.str != "true" || module1.num != 0) {
          return 1
      }
      if (module1.fun(0) != 0) {
          return 1
      }
      return 0
    }
}

module.exports = function () {
    return moduleTest
}
