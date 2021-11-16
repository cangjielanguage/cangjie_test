// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

@JsObject
 class Complex {
    let bo: Bool
    let str: String
    let num: Int64
    let fun: (Int64) -> Int64
    init(   // EXPECTED: regex Only primary constructor is valid in a '@JsObject' annotated class
        bo!: Bool,
        str!: String,
        num!: Int64,
        fun!: (Int64) -> Int64
    ) {
        this.bo = bo
        this.str = str
        this.num = num
        this.fun = fun
    }
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
