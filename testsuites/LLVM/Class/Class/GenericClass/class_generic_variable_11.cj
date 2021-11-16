// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base<T> {
    var base: T
    init(x: T){
        base = x
    }

}

func foo(): Int32{
    return 3
}

class Data<T> <: Base<Int32> {
    static var f: ()->T // EXPECTED: regex static variable 'f' needs to be initialized when declaring
    init(input:T){
        f = foo
    }
}

func main(): Int64 {
    var i1:()->Int32
    var data: Data<Int32> = Data<Int32>(i1)
    var res: Int32 = Data<Int32>.f()
    if(res == 3){
        return 0
    }
    return 1
}
