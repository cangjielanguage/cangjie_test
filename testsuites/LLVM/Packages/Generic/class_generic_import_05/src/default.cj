// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import p1.A
import p1.B as Boo

func main(): Int64 {
    var a1 = C<Int32>(1)
    var a2 = D<Int32>(1)
    if ( a1.a != 1 ){
        return 1
    }
    if ( a2.a != 1 ){
        return 1
    }
    return 0
}

class C<T> <: p1.A<T>{
    var a: T
    init(x:T){
        a = x
    }
}

class D<T> <: Boo<T>{
    init(x:T){
        super(x)
    }
}

