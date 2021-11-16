// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    func f(x: Float32*String): Float32*String { return x}
}

let res: Test = Test()
var res1 = res.f((3.14, "PIE"))

func run(): Int64 {
    if (res1[0] == 3.14 && res1[1] == "PIE") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
