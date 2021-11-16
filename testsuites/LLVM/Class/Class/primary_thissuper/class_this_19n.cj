// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Test {
    var a: Int32 = 2
    Test(){}
    func f(){
        this.init()             // EXPECTED: regex 'init' is keyword not identifier
    }
}

class Data<T> {
    var a: T
    Data(x: T){
        a = x
    }
    func f(){
        this.init()             // EXPECTED: regex 'init' is keyword not identifier
    }
}

func run(): Int64 {
    var test: Test = Test(3)
    var data: Data<Int32> = Data<Int32>(4)
    return 0
}

func main(): Int64 {
    return run()
}
