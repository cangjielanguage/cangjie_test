// DEPENDENCE: ../../src
// EXEC: %compiler %cmp_opt -c src/bbb/b_01.cj -o bbb.%middle && %copycharjs src/bbb
// EXEC: %compiler %cmp_opt src/aaa/%n.cj bbb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package aaa
import bbb.foo

func main():Int64 {
    var TimeUnit = COO()
    var a = TimeUnit.foo(1,"a")
    if ( a != 12 ) {
        return 1
    }
    return 0
}

enum TimeUnit {
    foo | foo(Int32) | foo(Int64,String)
}

class COO {
    func foo(x:Int32){
        return 11
    }

    func foo(x:Int64,y:String){
        return 12
    }
}
