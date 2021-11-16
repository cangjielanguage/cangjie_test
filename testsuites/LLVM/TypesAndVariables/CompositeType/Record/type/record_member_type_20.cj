// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    let a: Float64
    init(x: Float64) {
        a = x
    }
}

let res = Test(3.0)
let res1 = res.a

func run(): Int64 {
    if (res1 == 3.0) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
