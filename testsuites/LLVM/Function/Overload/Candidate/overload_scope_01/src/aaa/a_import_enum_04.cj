// DEPENDENCE: ../../src
// EXEC: %compiler %cmp_opt -c src/bbb/b_01.cj -o bbb.%middle
// EXEC: %compiler %cmp_opt %n.cj bbb.%middle -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dump

package aaa
import bbb.foo

func main():Int64 {
    var a = foo(1)
    var b = match (a) {
        case _ => 3
    }
    if ( b != 3 ) {
        return 1
    }
    return 0
}

enum ccc {
    foo | foo(Int64) | foo(Int64,String)
}


