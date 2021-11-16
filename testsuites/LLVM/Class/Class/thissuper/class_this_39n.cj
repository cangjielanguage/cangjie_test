// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Test {
    var a: Int32
    var b: Int32
    var i: Int32 = 1
    init(){}
    init(x: Int32, y: Int32){
        this()
        this(this.i)    // EXPECTED: regex call to 'this' must be first expression in constructor of class 'Test'
        b = y
    }
    init(x: Int32){
        a = x
    }
}

class Data<T> {
    var a: Int32
    var b: T
    var i: Int32 = 1
    init(){}
    init(x: T, y: T){
        this()
        this(this.i)  // EXPECTED: regex call to 'this' must be first expression in constructor of class 'Data'
        b = y
    }
    init(x: Int32){
        a = x
    }
}

func run(): Int64 {
    var test: Test = Test(2,3)
    var data: Data<Int32> = Data<Int32>(4,5)
    print(test.a.toString())
    print(test.b.toString())
    if(test.a == 1 && test.b == 3 && data.a == 1 && data.b == 5){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
