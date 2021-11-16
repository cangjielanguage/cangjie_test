// DEPENDENCE: ../../src
// EXEC: %compiler %cmp_opt -c src/bbb/b_01.cj -o bbb.%middle && %copycharjs src/bbb
// EXEC: %compiler %cmp_opt src/aaa/%n.cj bbb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package aaa
import bbb.foo

func main():Int64 {
    var coo = COO(1)
    var a = coo.call()
    if ( a != 2 || coo.res != 2 ) {
        return 1
    }
    return 0
}

external func foo(x:Int32){
    return 1
}

external func foo(x:Int64){
    return 2
}

external func foo(x:Int64,y:String){
    return 3
}

external func foo(x:Int64,y:Char){
    return 4
}

enum TimeUnit {
    foo | foo(Int32) | foo(Int64,String)
}


class COO {
    func foo(x:Int32){
        return 11
    }

    func foo(x:Int64){
        return 12
    }

    func foo(x:Int64,y:String){
        return 13
    }
    var res: Int32 = 1
    init(){}
    init(x:Int32){
        this()
        var a = foo(1) // call foo(x:Int64) in oneself(class COO)
        var b = TimeUnit.foo(1) // call foo from Enum
        //var c = aaa.foo(1) // should not import itself
        var d = foo(1,'a') // call foo from top-level
        var e = bbb.foo(1) // call foo from  other package
        var f = match (b) { case _ => 0 }
        if ( a != 12 ||  d != 4 || e != 20 || f != 0 ) {
            res--
        }else{
            res++
        }


    }
    func call(){
        var a = foo(1) // call foo(x:Int64) in oneself(class COO)
        var b = TimeUnit.foo(1) // call foo from Enum
        //var c = aaa.foo(1) // should not import itself
        var d = foo(1,'a') // call foo from top-level
        var e = bbb.foo(1) // call foo from  other package
        var f = match (b) { case _ => 0 }
        if ( a != 12  || d != 4 || e != 20 || f != 0 ) {
            return 1
        }
        return 2
    }

}

