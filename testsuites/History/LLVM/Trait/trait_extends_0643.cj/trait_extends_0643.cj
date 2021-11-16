// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Eq1 {
    func plus(a: This, b: This): This
}

trait Eq2 where This <: Eq1{
    func plus(a: This, b: Float64): Float64
}

append Int64 with Eq2  {
    func plus(a: Int64, b: Float64): Float64 { b }
}

append Int64 with Eq1 {
    func plus(a: Int64, b: Int64): Int64 { a + b }
}

func run(): Int64 {
    let x = plus(2,3)
    let y = plus(1,1.0)

    if ( x == 5 && y == 1.0) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}