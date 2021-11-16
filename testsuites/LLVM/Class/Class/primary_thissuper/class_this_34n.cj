// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Test {
    var i: Int32 = 2
    init(){
        i = i+1
    }
    Test(x: Int32){
        init()
        var this.i2 = 4  // EXPECTED: regex  'this' is keyword not identifier
    }
}

class Data<T> {
    var i1: T
    var i2: T
    init(){}
    Data(x: T){
        init()
        var this.i3 = 4   // EXPECTED: regex 'this' is keyword not identifier
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
