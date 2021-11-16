// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type CD<T> = ClassData<T>

class ClassData<T>{
    var a: T
    init(x: T){
        a = x
    }
}

trait Num{
    func add(x: This, y: This): Int32
}

append Int32 with Num{
    func add(x: Int32, y: Int32): Int32{
        return x+y
    }
}

func foo<V>(x: CD<V>): V where V <: Num{
    return x.a
}

func main(): Int64 {
    var cd: CD<Int32> = ClassData<Int32>(2)
    var a: Int32  = foo<Int32>(cd)
    var res: Int32 = add(a, a+1)
    if (res == 5) {
        return 0
    }
    return 1
}