// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsObject
class object10{
  object10(
     let name!: String
  ) {}
}

@JsObject
class Complex {
  Complex(
      let num!: Int16,
      let en!: object10,
      var num2!: Float32,
      var num3!: Int64
  ) {}
}

@JsMember["./momentMember"]
foreign func isMoment(obj:Complex) : Float64*Int64

func main() {
  object_10().main1()
}

class object_10{
  func main1() {
    let res = isMoment(Complex(
      num: 4,
      en: object10(name:"object10"),
      num2: 4.0,
      num3: 5
    ))
    if (res[0]!=5.0) {
      return 1
    }
    return 0
  }
}

