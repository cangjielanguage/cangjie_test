// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Test {
    class Inner{
        var inner: Int32 = 4
    }
    func f(): Int32{
        this.Inner()     // EXPECTED: regex object cannot access static member 'Inner'
        return 0
    }
}

class Data<T> {
    class Inner{
        var inner: Int32 = 4
    }
    func f(a: T): Int32{
        this.Inner()      // EXPECTED: regex object cannot access static member 'Inner'
        return 0
    }

}

func run(): Int64 {
    var test: Test = Test(2)
    var data: Data<Int32> = Data<Int32>(2)
    return 0
}

func main(): Int64 {
    return run()
}
