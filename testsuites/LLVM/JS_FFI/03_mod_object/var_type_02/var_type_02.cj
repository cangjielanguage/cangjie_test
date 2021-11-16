// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
@JsObject
class Complex {
  Complex(
      let str!: String,
      let chr!:Char,
      var num!: Int8,
      var num2!: Int16
  ) {}
}

@JavaScript
foreign class Moment {
  func fromNow(obj:Complex) : UInt64
}

@JsModule["./momentModule"]
foreign func moment1() : Moment

func main() {
  object_02().main1()
}

class object_02{
   func main1() {
    let res = moment1().fromNow(Complex(
      str: "true",
      chr:'t',
      num: 0,
      num2:0
    ))
    print(res.toString())
    if (res != 0) {
      return 1
    }
    return 0
  }
}
