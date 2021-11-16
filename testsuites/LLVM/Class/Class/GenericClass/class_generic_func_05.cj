// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1| compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base<T> {
    var base: T
    init(x: T){
        base = x
    }

}

func foo<T>(x: T): T{
    return x
}

class Data<T> <: Base<T> {
    static var f: (T) -> T // EXPECTED: regex static variable 'f' needs to be initialized when declaring
    init(){
        f = foo<T>
    }
}

func main(): Int64 {
    var i1: Int32 = 3
    var data: Data<Int32> = Data<Int32>()
    var res: Int32 = Data<Int32>.f(i1)
    if(res == 3){
        return 0
    }
    return 1
}
