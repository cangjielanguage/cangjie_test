// DEPENDENCE: ../../src
// EXEC: %compiler %cmp_opt -c src/bbb/b_01.cj -o bbb.%middle && %copycharjs src/bbb
// EXEC: %compiler %cmp_opt src/aaa/%n.cj bbb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package aaa
import bbb.foo

func main():Int64 {
    var c = bbb.foo(1) // choose ENUM.foo,not import
    var d = match (c) {
        case foo(a) => 0
        case _ => 3
    }
    if ( d != 0 ) {
        return 1
    }
    return 0
}

enum bbb {
    foo | foo(Int32) | foo(Int64,String)
}

