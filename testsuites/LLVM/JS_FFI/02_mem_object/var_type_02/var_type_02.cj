// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsObject
class Complex {
  Complex(
      let str!: String,
      let chr!:Char,
      let num!: Int8,
      let num2!: Int16
  ) {}
}

@JsMember["./momentMember"]
foreign func isMoment(obj:Complex) : UInt64

func main() {
  object_02().main1()
}

class object_02{
  func main1() {
    let res = isMoment(Complex(
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
