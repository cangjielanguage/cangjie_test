// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsObject
 class Complex {
    Complex(
        let bo!: Bool,
        let str!: String,
        let num!: Int64,
        let fun!: (Int64) -> Int64
    ) {}
}

@JsMember["./momentMember"]
foreign func isMoment(obj:Complex) : UInt32

func main() {
    let res = isMoment(Complex(
        bo: false,
        str: "true",
        num: 0,
        fun: { data: Int64 => return data }
    ))
    if (res != 0) {
        return 1
    }
    return 0
}
