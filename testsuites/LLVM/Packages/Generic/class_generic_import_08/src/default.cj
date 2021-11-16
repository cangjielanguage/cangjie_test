// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o a.%middle
// EXEC: %compiler %cmp_opt a.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import p1.A
import p1.B as Boo

func main(): Int64 {
    var a1 = A<Int32>()
    if ( a1.goo(1) != 1 ){
        return 1
    }
    var a2 = Boo<Int32>()
    if ( a2.goo() != 2 ){
        return 1
    }
    return 0
}

extend p1.A<T> {
    func goo(x:T){return x}
}

extend Boo<T> <: I{
}

interface I {
    func goo(){return 2}
}