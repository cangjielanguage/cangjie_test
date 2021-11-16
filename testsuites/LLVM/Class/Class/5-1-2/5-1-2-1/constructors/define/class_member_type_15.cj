// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func foo<T>(x: T): T{
    return x
}

class Test {
    var f1: (Int32) -> Int32 = foo<Int32>
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
    var test: Test = Test(foo<Int32>)
    let res1: Int32 = test.f1(i)
    let res2: Int32 = test.f2(i+1)
    let res3: Int32 = test.f3(foo<Int32>)(i)
    if ( res1 == 2 && res2 == 3 && res3 == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}