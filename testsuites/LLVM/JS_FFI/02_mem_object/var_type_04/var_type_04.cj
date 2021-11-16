// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix


@JsObject
class Complex {
  Complex(
      let num1!: UInt32,
      let num2!: Float16,
      var num3!: Float32,
      var num4!: UInt64,
      let fun!:(UInt64) -> UInt64
  ) {}
}

@JsMember["./momentMember"]
foreign func isMoment(obj:Complex) : Bool

func main() {
  object_04().main1()
}

class object_04{
  func main1() {
    let res = isMoment(Complex(
      num1: 1,
      num2: 2.0,
      num3: 2.0,
      num4: 4,
      fun: { data: UInt64 => return data }
    ))
    if (res) {
        return 1
    }
    return 0
  }
}
