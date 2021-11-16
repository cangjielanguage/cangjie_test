// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

abstract class FaTest {
    var a: Int32 = 1
    func f(x: Int32): Int32
}

class Test <: FaTest{
    func foo(x: Int32){
        a = super.f(x)  // EXPECTED: regex-auto abstract method 'f' cannot be accessed directly
    }
    func f(x: Int32): Int32{
        return x+1
    }
}


func run(): Int64 {
    var test: Test = Test()
    test.foo(3)
    var res1: Int32 = test.a
    if (res1 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
