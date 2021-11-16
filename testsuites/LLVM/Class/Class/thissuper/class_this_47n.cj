// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


class Test {
    var a: Int32 = 2
    var b: Int32 = 4
    init(t: Test){}
    init(x: Int32, y: Int32){
        a = x
        b = y
    }
    func foo(){
        this(this)    // EXPECTED: regex invalid calling 'this' outside the constructor
    }
}

class Data<T> {
    var a: T
    var b: T
    init(d:Data<T>){}
    init(x: T, y: T){
        a = x
        b = y
    }
    func foo(){
        this(this)  // EXPECTED: regex invalid calling 'this' outside the constructor
    }

}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>(3,5)
    test.foo()
    data.foo()
    if(test.a == 3 && data.b == 4){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
