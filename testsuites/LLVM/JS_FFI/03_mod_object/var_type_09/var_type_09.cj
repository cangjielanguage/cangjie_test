// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsObject
class Complex {
  Complex(
      let num1!: Int8,
      let Tu!: Float16*Float32*Float64*Int16*Int32*Int64,
      var num2!: Float64,
      var num3!: UInt16
  ) { }
}

@JavaScript
foreign class Moment {
  func fromNow(obj:Complex) : (UInt64)->String
}

@JsModule["./momentModule"]
foreign func moment1() : Moment

func main() {
    let res = moment1().fromNow(Complex(
      num1: 1,
      Tu:(1.0,2.0,3.0,3,2,1),
      num2: 2.0,
      num3: 3
    ))
    if (res(2)!="22") {
      return 1
    }
    return 0
}