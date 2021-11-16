// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c p1/a.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %f p1.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import p1.a
import p1.b

func main(): Int64 {
    if ( foo(a) != 1 ){
        return 1
    }
    if ( goo() != 1 ){
        return 2
    }
    return 0
}

func foo(x:Int64){return x}
func goo(x!:Int64=a){return x}
