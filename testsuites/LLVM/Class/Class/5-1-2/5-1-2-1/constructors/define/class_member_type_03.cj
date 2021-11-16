// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Test {
    var a: Float64 = 2.23e-308
    var b: Float64
    init(x: Float64){
        b = x
    }
    func f(x: Float64): Float64{
        return x + 1.2
    }
}

func run(): Int64 {
    var test: Test = Test(-1.79e308)
    var res1: Float64 = test.a
    var res2: Float64 = test.b
    var res3: Float64 = test.f(3.14)
    if (res1 == 2.23e-308 && res2 == -1.79e308 && res3 == 4.34) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
