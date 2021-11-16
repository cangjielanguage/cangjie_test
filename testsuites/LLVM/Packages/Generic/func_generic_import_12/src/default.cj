// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import p1.coo
import p1.B

func main(): Int64 {
    var r4 = coo<A>(A(1))
    if ( r4.a != 1 ){
        return 1
    }
    return 0
}

class A <: B {
    var a:Int32
    init(x: Int32){
        a = x
    }
}
