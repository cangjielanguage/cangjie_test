// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Test {
    static var i: Int32 = 2
    static func foo(): Int32 {
        this.i          // EXPECTED: regex  non-static variable 'this' cannot be referenced from a static context
        this.bar()      // EXPECTED: regex  non-static variable 'this' cannot be referenced from a static context
        return 0
    }
    func bar():Int32{
        return 3
    }
}

class Data<T> {
    static var i: Int32 = 2
    static func foo(): Int32{
        this.i          // EXPECTED: regex  non-static variable 'this' cannot be referenced from a static context
        this.bar()      // EXPECTED: regex  non-static variable 'this' cannot be referenced from a static context
        return 3
    }
    func bar(): Int32 {
        return 3
    }

}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    return 0
}

func main(): Int64 {
    return run()
}
