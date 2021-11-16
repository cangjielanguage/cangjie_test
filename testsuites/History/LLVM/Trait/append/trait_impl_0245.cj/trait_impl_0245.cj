// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func five(a: This, b: Float32, c: Int16, d: Int64, e: Float64): Float64
}

append Int32 with Num {
    func five(a: Int32, b: Float32, c: Int16, d: Int64, e: Float64): Float64{ e }
}

func run(): Int64 {
    let x: Float64  = five(1,2.0,2,3,3.0)

    if (x == 3.0) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
