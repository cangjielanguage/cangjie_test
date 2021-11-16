// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Test {
    var i: Int32 = 2
    init(){}
    init(t:Test){
        i = t.i + 1
    }
    init(x: Int32){
        this()
        this(this)  // EXPECTED: regex call to 'this' must be first expression in constructor of class 'Test'
    }
}

class Data<T> {
    var i1: T
    var i2: T
    init(){}
    init(d:Data<T>){}
    init(x: T){
        this()
        this(this)  // EXPECTED: regex call to 'this' must be first expression in constructor of class 'Data'
    }
}

func run(): Int64 {
    var test: Test = Test(2)
    var data: Data<Int32> = Data<Int32>(3)
    var res1: Int32 = test.i
    var res2: Int32 = data.i1
    if(res1 == 5 && res2 == 3){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
