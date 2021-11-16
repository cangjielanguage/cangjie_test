// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix


@JsObject
class Complex {
  Complex(
      let num1!: Int32,
      let num2!: UInt8,
      var num3!: UInt16,
      var num4!: Int64
  ){}
}

@JsMember["./momentMember"]
foreign func isMoment(obj:Complex) : String

func main() {
  let res = isMoment(Complex(
    num1:1,
    num2:2,
    num3:2,
    num4:4
  ))
  print(res)
  if (res != "6") {
    return 1
  }
  return 0
}
