// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Test {
    var a: Bool = true
    var b: Bool
    init(x: Bool){
        b = x
    }
    func f(x: Bool): Bool{
        return x
    }
}

func run(): Int64 {
    var test: Test = Test(false)
    var res1: Bool = test.a
    var res2: Bool = test.b
    var res3: Bool = test.f(false)
    if (res1 && !res2 && !res3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}