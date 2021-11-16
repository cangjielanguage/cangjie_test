// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Test {
    var a: Int32
    var b: Int32
    var i: Int32 = 1
    init(){}
    Test(x: Int32, y: Int32){
        this()          // EXPECTED: regex invalid calling 'this' in primary constructor
        this(this.i)    // EXPECTED: regex invalid calling 'this' in primary constructor
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
    Data(x: T, y: T){
        this()        // EXPECTED: regex invalid calling 'this' in primary constructor
        this(this.i)  // EXPECTED: regex invalid calling 'this' in primary constructor
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
    if(test.a == 1 && test.b == 3 && data.a == 1 && data.b == 5 ){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
