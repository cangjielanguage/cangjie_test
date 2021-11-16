// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsObject
class Complex {
    Complex(
        let str!:String,
        let fun!: (Int8) -> String,
        var num!:Int32,
        var Un!:Unit
    ) {}
}

@JsMember["./momentMember"]
foreign func isMoment(obj:Complex) : Unit

func main() {
    let res = isMoment(Complex(
      str:"object7",
      fun: {num:Int8 => return num.toString()},
      num:7,
      Un:()
    ))
    if (res !=()) {
      return 1
    }
    return 0
}
