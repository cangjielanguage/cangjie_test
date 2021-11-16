// DEPENDENCE: momentMember.js
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

@JsRename["isMoment"]
@JsMember["./momentMember"]
foreign func varType02(obj:Complex) : UInt64

unsafe func main() {
  object_02().main1()
}

class object_02{
  unsafe func main1() {
    let res = varType02(Complex(
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
