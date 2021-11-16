// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a1 = B()
    var a2 = a1.foo(1,{x:Int64 => x+ 1})
    if ( a2 != 3) {
        return 1
    }
    var a3 = a1.foo(1){x:Int64 => x+ 1}
    if ( a3 != 3) {
        return 1
    }
    return 0
}

open class A {
    var a:Int32 = 1
    open func foo(a: Int64, fn: (Int64)->Int64) {
        return  fn(a)
    }

}

class B <: A {
    var b:Int32 = 2
    override func foo(a: Int64, fn: (Int64)->Int64){
        return  fn(a) + 1
    }
}
