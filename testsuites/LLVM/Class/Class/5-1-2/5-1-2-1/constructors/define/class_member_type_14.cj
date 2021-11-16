// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func foo(x: Int32): Int32{
    return x + 1
}

class Test {
    var f1: (Int32) -> Int32 = foo
    var f2: (Int32) -> Int32
    init(x: (Int32) -> Int32){
        f2 = x
    }
    func f3(x: (Int32) -> Int32): (Int32) -> Int32{
        return x
    }
}

func run(): Int64 {
    var i: Int32 = 2
    var test: Test = Test(foo)
    let res1: Int32 = test.f1(i)
    let res2: Int32 = test.f2(i+1)
    let res3: Int32 = test.f3(foo)(i)
    if ( res1 == 3 && res2 == 4 && res3 == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
