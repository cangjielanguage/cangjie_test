// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    func f(x: Float64): Float64 { return x}
}

let res = Test()
let res1 = res.f(2.0)

func run(): Int64 {
    if (res1 == 2.0) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
