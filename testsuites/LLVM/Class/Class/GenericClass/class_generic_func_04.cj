// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1| compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base<T> {
    var base: T
    init(x: T){
        base = x
    }

}

class Data<T> <: Base<T> {
    static var f: (T)-> T // EXPECTED: regex static variable 'f' needs to be initialized when declaring
    init(){
        f = this.foo
    }
    static func foo(x: T): T{
        return x
    }
}

func main(): Int64 {
    var i1: Int32 = 4
    var data: Data<Int32> = Data<Int32>()
    var res: Int32 = Data<Int32>.f(i1)
    if(res == 4){
        return 0
    }
    return 1
}
