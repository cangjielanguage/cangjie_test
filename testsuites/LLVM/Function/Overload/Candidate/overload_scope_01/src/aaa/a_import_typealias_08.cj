// DEPENDENCE: ../../src
// EXEC: %compiler %cmp_opt -c src/bbb/b_01.cj -o bbb.%middle && %copycharjs src/bbb
// EXEC: %compiler %cmp_opt src/aaa/%n.cj bbb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package aaa
import bbb.foo
type bbb = TimeUnit

func main():Int64 {
    var a = bbb.foo(1) // type尚不支持构造器和path的替换
    if ( a != 12 ) {
        return 1
    }
    return 0
}

func foo(x:Int32){
    return 1
}

func foo(x:Int64){
    return 2
}

func foo(x:Int64,y:String){
    return 3
}

func foo(x:Int64,y:Char){
    return 4
}

enum TimeUnit {
    foo | foo(Int32) | foo(Int64,String)
}


