// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base<T> {
    var a: T
    init(x: T){
        a = x
    }
}

class Data<T> <: Base<Int32> {
    var f: T
    init(){
        f = 2  // EXPECTED: regex type incompatible in this assignment
    }
}


func run(): Int64 {
    var i1: Int64 = 4
    var data: Data<Int64> = Data<Int64>(i1)
    return 0
}

func main(): Int64 {
    return run()
}