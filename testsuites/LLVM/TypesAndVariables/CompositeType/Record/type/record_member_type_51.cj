// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    func f(x: Array<Int32>): Array<Int32> { return x}
}

let res = Test()
let res1 = res.f(@{1,3})

func run(): Int64 {
    if (res1[0] == 1 && res1[1] == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}