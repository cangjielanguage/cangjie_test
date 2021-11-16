// DEPENDENCE: momentModule.js
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

@JavaScript
foreign class Moment {
  func fromNow(obj:Complex) : Unit
}

@JsModule["./momentModule"]
foreign func moment1() : Moment

func main() {
    let res = moment1().fromNow(Complex(
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
