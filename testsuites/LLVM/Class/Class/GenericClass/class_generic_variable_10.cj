// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base<T> {
    var base: T
    init(x: T){
        base = x
    }

}

class Data<T> <: Base<Int32> {
    static var f: ()->T // 
    var b: T
    init(input:T){
        b = input
        f = foo
    }
    static func foo(): T{
        return b
    }
}

func main(): Int64 {
    var i1: Int32 = 4
    var data: Data<Int32> = Data<Int32>(i1)
    var res = Data<Int32>.f
    if(res == 4){
        return 0
    }
    return 1
}
