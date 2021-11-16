// DEPENDENCE: ../../src
// EXEC: %compiler %cmp_opt -c src/bbb/b_01.cj -o bbb.%middle && %copycharjs src/bbb
// EXEC: %compiler %cmp_opt -c src/ccc/c_01.cj -o ccc.%middle && %copycharjs src/ccc
// EXEC: %compiler %cmp_opt src/aaa/%n.cj bbb.%middle ccc.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package aaa
import ccc.COO as bbb
import bbb.foo

func main():Int64 {
    var a = bbb.foo(1) 
    if ( a != 100 ) {
        return 1
    }
    return 0
}



