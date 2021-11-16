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
    var b: T
    var f: T
    init(x: T, y: T){
        super(0)
        a = x
        b = y
        f = this.foo()    // EXPECTED: regex 'foo' is not allowed to be accessed before all member variables are initialized
    }
    func foo(): T{
        return b
    }
}

func main(): Int64 {
    var i1: Int32 = 3
    var i2: Int32 = 4
    var data: Data<Int32> = Data<Int32>(i1, i2)
    var res1: Int32 = data.a
    var res2: Int32 = data.f
    if(res1 == 3 && res2 == 4){
        return 0
    }
    return 1
}