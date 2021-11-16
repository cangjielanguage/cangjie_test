// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import p1.A
import p1.B as Boo

func main(): Int64 {
    var a1 = E<Boo<Int32>>()
    if ( a1.foo(Boo<Int32>(1)).a != 1 ){
        return 1
    }
    var a2 = F<A<Int32>>()
    return 0
}

class C<T> where T<: p1.A<T>{
    var a: T
    init(x:T){
        a = x
    }
}

class D<T> where T <: Boo<T>{
}

class E<T> where T <: Boo<Int32>{
    func foo(x:T){return x}
}

class F<T> where T <: A<Int32>{
    var a = T.foo(Option<Int32>.None)
}
