// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsObject
class Complex {
  Complex(
      let num1!: Int8,
      let Tu!: Float16*Float32*Float64*Int16*Int32*Int64,
      var num2!: Float64,
      var num3!: UInt16
  ) {}
}

@JsMember["./momentMember"]
foreign func isMoment(obj:Complex) : (UInt64)->String

unsafe func main() {
    let res = isMoment(Complex(
      num1: 1,
      Tu:(1.0,2.0,3.0,3,2,1),
      num2: 6.0,
      num3: 1
    ))
    if (res(2)!="22") {
      return 1
    }
    return 0
}