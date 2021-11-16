// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num1 {
    func plus(a: This, b: This): This
}

trait Num2 {
    func self(a: This): This
}

append Int32 with Num1 ,Num2 {
    func plus(a: Int32, b: Int32): Int32 { a + b }
    func self(a: Int32): Int32 { a + 1 }
}

func run(): Int64 {
    let x: Int32  = plus(1,1)
    let y: Int32  = self(1)
    if (x == y) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}