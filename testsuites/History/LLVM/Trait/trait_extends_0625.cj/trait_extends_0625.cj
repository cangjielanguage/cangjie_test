// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Eq1 {
    func plus(a: This, b: This): This
}

trait Eq2 where This <: Eq1{
    func time(a: This, b: This): This
}

trait Num where This <: Eq2  {
    func self(a: This): This
}

append Int32 with Num {
    func self(a: Int32): Int32 { a + 1 }
}

append Int32 with Eq1 {
    func plus(a: Int32, b: Int32): Int32 { a + b }
}

append Int32 with Eq2 {
    func time(a: Int32, b: Int32): Int32 { a * b }
}

func run(): Int64 {
    let x : Int32 = plus(1,1)
    let y : Int32 = time(1,2)
    let z : Int32 = self(1)
    if ( x == 2 && y == 2 && z == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}