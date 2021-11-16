// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Test {
    // let a: List<Int64> = [1, 2, 3]
    var a: ListFloat64 = ListFloat64(2, 10.0)
    var b: ListFloat64
    init(x: ListFloat64){
        b = x
    }
    func f(x: ListFloat64): ListFloat64{
        return x
    }
}

func run(): Int64 {
    var test: Test = Test(ListFloat64(3, 6.0))
    var res1: ListFloat64 = test.a
    var res2: ListFloat64 = test.b
    var res3: ListFloat64 = test.f(ListFloat64(4, 7.0))
    if (res1.count() == 2 && res1.get(1) == 10.000000 && res2.count() == 3 && res2.get(2) == 6.000000 && res3.count() == 4 && res3.get(3) == 7.000000) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}