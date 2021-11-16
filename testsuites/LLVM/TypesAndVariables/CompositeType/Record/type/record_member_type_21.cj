// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    let a: Bool
    init(x: Bool) {
        a = x
    }
}

let res = Test(true)
let res1 = res.a

func run(): Int64 {
    if (res1) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
