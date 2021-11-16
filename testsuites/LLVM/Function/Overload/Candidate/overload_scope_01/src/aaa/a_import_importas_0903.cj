// DEPENDENCE: ../../src
// EXEC: %compiler %cmp_opt -c src/bbb/b_01.cj -o bbb.%middle && %copycharjs src/bbb
// EXEC: %compiler %cmp_opt -c src/ccc/c_01.cj -o ccc.%middle && %copycharjs src/ccc
// EXEC-PIPE-1: %compiler %cmp_opt src/aaa/%n.cj bbb.%middle ccc.%middle -o %output 2>&1 | compare %f

package aaa
import bbb.foo
import ccc.COO as bbb // EXPECTED: regex error.*redefinition of declaration 'bbb'
type bbb = TimeUnit 

func main():Int64 {
    var a = bbb.foo(1) 
    var b = match (a) {
        case _ => 0
    }
    if ( b != 0 ) {
        return 1
    }
    return 0
}

enum TimeUnit {
    foo | foo(Int32) | foo(Int64,String)
}
