// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base<> {
    var a: T
    init(x: T){
        a = x
    }
}

class Data<T> <: Base<Int32> {
    var f: T
    init(input: T){
        super(0)
        f = input
    }
}

func run(): Int64 {
    var i1: Int64 = 4
    var data: Data<Int64> = Data<Int64>(i1)
    var res: Int64 = data.f
    if (res == 4){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
