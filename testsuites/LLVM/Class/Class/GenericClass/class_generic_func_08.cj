// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

open class Base<T> {
    protected func foo(x: T): T{
        return x
    }
}

class Data<T> <: Base<T> {
    init(x:T){}
}

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>(2)
    var res: Int32 = data.foo(4) // EXPECTED: regex no matching function declaration for function call
    if(res == 4){
        return 0
    }
    return 1
}
