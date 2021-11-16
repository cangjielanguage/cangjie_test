// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Test {
    var a: Int32 = 2147483647
    var b: Int32
    init(x: Int32){
        b = x
    }
    func f(x: Int32): Int32{
        return x + 1
    }
}

func run(): Int64 {
    var test: Test = Test(-2147483648)
    var res1: Int32 = test.a
    var res2: Int32 = test.b
    var res3: Int32 = test.f(3)
    if (res1 == 2147483647 && res2 == -2147483648 && res3 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
