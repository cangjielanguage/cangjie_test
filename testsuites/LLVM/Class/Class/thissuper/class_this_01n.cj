// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Test {
    var i: Int32 = 2
    func foo(): Int32{
        return 3
    }
    var res1 = this.i
    var res2 = this.foo()    // EXPECTED: regex 'foo' is not allowed to be accessed before all member variables are initialized

}

class Data<T> {
    var i: Int32 = 2
    func foo(): Int32 {
        return 3
    }
    var res1 = this.i
    var res2 = this.foo()    // EXPECTED: regex 'foo' is not allowed to be accessed before all member variables are initialized
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    return 0
}

func main(): Int64 {
    return run()
}
