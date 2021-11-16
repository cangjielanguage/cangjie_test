// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func own(a: This): This
}

append Float64 with Num {
    func own(a: Float64): Float64 { a }
}

func run(): Int64 {
    let x: Float64  = own(1.0)
    if (x == 1.0) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}