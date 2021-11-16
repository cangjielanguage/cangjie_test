// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import p1.A
import p1.B as Boo
import p1.C

func main(): Int64 {
    var a1 = D<Int32>(1)
    var a2 = E<Int32>(1)
    if ( a1.b != 1 ){
        return 1
    }
    if ( a2.a != 1 ){
        return 1
    }
    return 0
}

class D<T> <: A<T>{
    var b: T
    init(x:T){
        b = x
    }
}

class E<T> <: Boo<T>{
    var a: T
    init(x:T){
        a = x
    }
}
