// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


class Test {
    let a: Int32
    init(x: Int32){
        a = x
    }
    func f(x: Int32): Test {
        return Test(x)
    }
}

func run(): Int64 {
    var test: Test = Test(1)
    var res: Test = test.f(2)
    if(res.a == 2){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}