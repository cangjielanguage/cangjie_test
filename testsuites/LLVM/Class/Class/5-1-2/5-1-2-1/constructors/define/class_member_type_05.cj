// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Test {
    var a: Unit = ()
    var b: Unit
    init(x: Unit){
        b = x
    }
    func f(x: Unit): Unit{
        return x
    }
}

func run(): Int64 {
    var test: Test = Test(())
    var res1: Unit = test.a
    var res2: Unit = test.b
    var res3: Unit = test.f(())
    if (res1 == () && res2 == () && res3 == ()) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
