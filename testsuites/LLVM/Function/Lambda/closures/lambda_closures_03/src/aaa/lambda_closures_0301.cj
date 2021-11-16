// DEPENDENCE: ../../src
// EXEC: %compiler %cmp_opt -c src/bbb/b01.cj -o bbb.%middle && %copycharjs src/bbb
// EXEC: %compiler %cmp_opt src/aaa/%n.cj bbb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package aaa
import bbb.foo1
import bbb.foo2
import bbb.foo4

func main():Int64 {
    if ( case01()({1}) != 1 ) {
        return 1
    }
    if ( case02()({1}) != 2 ) {
        return 2
    }
    if ( foo2({1}) != 2 ) {
        return 3
    }
    if ( foo4({1}) != 4 ) {
        return 3
    }
    return 0
}

func case01(){
    return foo1
}

func case02(){
    return foo2
}
