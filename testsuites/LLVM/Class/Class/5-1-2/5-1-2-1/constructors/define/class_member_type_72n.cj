// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Test {
    let a: Int32 = 2
    func f(x: Test): Int32 {
        return x.a
    }
}

func run(): Int64 {
    var test: Test = Test()
    var res: Int32= test.f(test)
    if (res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
