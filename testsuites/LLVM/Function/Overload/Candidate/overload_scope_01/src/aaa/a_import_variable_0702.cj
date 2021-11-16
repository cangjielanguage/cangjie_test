// DEPENDENCE: ../../src
// EXEC: %compiler %cmp_opt -c src/bbb/b_01.cj -o bbb.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %n.cj bbb.%middle -o %output 2>&1 | compare %f

package aaa
import bbb.foo

func main():Int64 {
    var bbb = COO()
    var a = bbb.foo(1,"a") // EXPECTED: regex no matching function declaration for function call 'foo'
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
