// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( Coo.foo<Int32>(1,2) != 2 || Boo<Int32>.foo<Int64>(3,4) != 4) {
        return 1
    }
    return 0
}

open class Boo<T> {
    static func foo<V>(x:T,y:V) {
        return y
    }
}

class Coo <: Boo<Int32> {
    redef static func foo<V>(x:Int32,y:V) {
        return y
    }
}
