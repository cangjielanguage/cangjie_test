// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Eq1 {
    func plus(a: This, b: This): This
}


trait Num where This <: Eq1{
    func self(a: This): This
}

append Int32 with Num {
    func self(a: Int32): Int32 { a + 1 }
}

append Int32 with Eq1 {
    func plus(a: Int32, b: Int32): Int32 { a + b }
}

func run(): Int64 {
    let x = plus(1,1)
    let y = self(1)
    if (x == y) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
