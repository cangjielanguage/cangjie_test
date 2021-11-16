// DEPENDENCE: ../../src
// EXEC: %compiler %cmp_opt -c src/bbb/b_01.cj -o bbb.%middle && %copycharjs src/bbb
// EXEC: %compiler %cmp_opt src/aaa/%n.cj bbb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package aaa
import bbb.foo

func main():Int64 {
    var bbb = COO()
    var a = bbb.foo(1) // call bbb from Class COO,because variable bbb shadow package bbb
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

class COO {
    func foo(x:Int32){
        return 11
    }

    func foo(x:Int64){
        return 12
    }
}


