// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base<T> {
    var i: Int32 = 2
}

class Test <: Base<Int32>{
    var i: Int32 = 3
    super.i = 4     // EXPECTED: regex illegal class member in class block
    var i1 = super.i
}

class Data<T> <: Base<T> {
    var i: Int32 = 3
    super.i = 5     // EXPECTED: regex illegal class member in class block
    var i1 = super.i
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    var res1: Int32 = test.i1
    var res2: Int32 = data.i1
    if(res1 == 4 && res2 == 5){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
