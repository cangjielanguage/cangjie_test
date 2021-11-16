// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
@JsObject
class object8 {
  object8(
      let name!: String,
      var num!:Int16
  ) {}
}

@JsObject
class Complex {
  Complex(
      let chr!: Char,
      //Li!: List<Int64>,
      var num!: UInt8,
      var bo!: Bool
  ) {}
}
@JavaScript
foreign class Moment {
  func fromNow(obj:Complex) : object8
}

@JsModule["./momentModule"]
foreign func moment1() : Moment

func main() {
  object_08().main1()
}

class object_08{
  func main1() {
    let res = moment1().fromNow(Complex(
      chr: 't',
      //Li: [1, 2, 3, 3, 2, 1] ,
      num: 8,
      bo: false
    ))
    print(res.name)
    if (res.name != "hhh") {
      return 1
    }
    return 0
  }
}

