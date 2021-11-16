// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

external interface I<T>{
    func foo(a:T):Int32{return Int32(1)}
}

external interface J<T>{
    func foo(a:T):Int32{return Int32(2)}
}

open external class A<T>{}

external class B<X,Y,Z> <: A<Int32> & I<Int8> &J<Int16>{
    func foo(a:Int8):Int32{return Int32(1)}
    func foo(a:Int16):Int32{return Int32(2)}
}


func main(){
    var a : B<Int8,Int16,Int32> = B<Int8,Int16,Int32>()
    if (a.foo(Int8(1)) != Int32(1)) {
        return 1
    }
    if (a.foo(Int16(1)) != Int32(2)) {
        return 1
    }
    return 0
}
