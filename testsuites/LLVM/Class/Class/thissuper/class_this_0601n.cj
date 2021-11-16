// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Test {
    var a: Int32 = 1
    var b: Int32
    init(){}
    init(b: Int32){
        init()
        this.c              // EXPECTED: regex 'c' is not a member of class 'Test'
    }
}

class Data<T> {
    var a: T
    var b: T
    init(){}
    init(a: T){
        init()
        this.c              // EXPECTED: regex 'c' is not a member of class 'Data'
    }
}

func run(): Int64 {
    var test: Test = Test(1)
    var data: Data<Int32> = Data<Int32>(4)
    return 0
}

func main(): Int64 {
    return run()
}
