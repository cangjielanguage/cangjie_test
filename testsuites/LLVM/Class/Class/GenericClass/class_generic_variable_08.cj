// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class Base<T> {
    var base: T
    init(x: T){
        base = x
    }

}

class Data<T> <: Base<Int32> {
    var a: T
    var f: T
    init(input:T){
        super(0)
        a = input
        f = foo()   // EXPECTED: regex 'foo' is not allowed to be accessed before all member variables are initialized
    }
    func foo():T{
        return a
    }
}

func main(): Int64 {
    var i1: Int32 = 4
    var data: Data<Int32> = Data<Int32>(i1)
    var res1: Int32 = data.a
    var res2: Int32 = data.f
    if(res1 == 4 && res2 == 4){
        return 0
    }
    return 1
}