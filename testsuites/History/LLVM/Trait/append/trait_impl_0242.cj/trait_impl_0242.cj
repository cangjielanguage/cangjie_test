// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func plus(a: This, b: This): This
    func minus(a: This, b: This): This
    func multiply(a: This, b: This): This
    func divide(a: This, b: This): This
    func self(a: This): This
}

append Int32 with Num {
    func plus(a: Int32, b: Int32): Int32 { a + b }
    func minus(a: Int32, b: Int32): Int32 { a - b }
    func multiply(a: Int32, b: Int32): Int32 { a * b }
    func divide(a: Int32, b: Int32): Int32 { a / b }
    func self(a: Int32): Int32 { a + 1 }
}

func run(): Int64 {
    let x: Int32  = plus(1,1)
    let y: Int32  = minus(1,1)
    let z: Int32  = multiply(1,1)
    let p: Int32  = divide(1,1)
    let q: Int32  = self(1)
    if ( x == q &&  y == 0 && z == 1 && p == 1) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}