// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c p1/a.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %f p1.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import p1.a

var b = p1.a
func main(): Int64 {

    if ( foo(b)() != 'a' ){
        return 1
    }
    if ( goo()() != 'a' ){
        return 2
    }
    return 0
}

func foo(x:()->Char){return x}
func goo(x!:()->Char=b){return x}
