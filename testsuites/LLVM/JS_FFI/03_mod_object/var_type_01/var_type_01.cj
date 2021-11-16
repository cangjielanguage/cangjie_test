// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsObject
class Complex {
    Complex(
        let bo!: Bool,
        let str!: String,
        let num!: Int64,
        let fun!: (Int64) -> Int64
        //opt!: Option<(Int64) -> Int64>
    ) {}
}
@JavaScript
foreign class Moment {
  func fromNow(obj:Complex) : UInt32
}

@JsModule["./momentModule"]
foreign func moment1() : Moment

unsafe func main() {
    let res = moment1().fromNow(Complex(
        bo: false,
        str: "true",
        num: 0,
        fun: { data: Int64 => return data }
        //opt: Option<(Int64) -> Int64>.Some({data: Int64 =>  return data })
    ))
    print(res.toString())
    if (res != 0) {
        return 1
    }
    return 0
}
