// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


trait Num1 {
    func self(a: Int32, b:This): Int32
}

trait Num2 {
    func plus(a: This, b: This): This
}

append Float64 with Num1, Num2 {
    func self(a: Int32, b: Float64): Int32 { a + 0 }
    func plus(a: Float64, b: Float64): Float64 { a + b }
}

func run(): Int64{
    let x = self(1,1.0)
    let y = plus(1.0,1.0)
    if (x==1 && y ==2.0) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

