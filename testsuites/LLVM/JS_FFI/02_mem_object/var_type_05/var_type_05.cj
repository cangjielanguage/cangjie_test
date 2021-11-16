// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsObject
class enum1 {
  enum1(
      let name!: String
  ) {}
}

@JsObject
class Complex {
  Complex(
      let num!: Float64,
      let Bo!: Bool,
      var Un!: Unit,
      var en!: enum1
  ) {}
}

@JsMember["./momentMember"]
foreign func isMoment(obj:Complex) : Char

func main() {
  let res = isMoment(Complex(
    num: 1.0,
    Bo: false,
    Un: (),
    en: enum1(name:"object5")
  ))
  if (res=='F') {
    return 1
  }
  return 0
}
