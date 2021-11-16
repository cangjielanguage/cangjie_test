// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test1 {
    var a: Int32 = 2
}

record Test2 {
    func f(x: Test1): Test1 { return x}
}

let res = Test2().f(Test1())
let res1 = res.a

func run(): Int64 {
    if (res1 == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
