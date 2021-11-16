// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    func f(x: Bool): Bool { return x}
}

let res = Test()
let res1 = res.f(true)

func run(): Int64 {
    if (res1) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
