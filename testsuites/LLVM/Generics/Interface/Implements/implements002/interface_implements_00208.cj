// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface I<T>{
    func foo(a:T):Int32
}

interface J<T>{
    func foo(a:T):Int32
}

open external class A<T>{}

abstract class B<X,Y,Z> <: A<Int32> & I<Int8> &J<Int8>{}


func main(){
    var a : B<Int8,Int16,Int32>
    return 0
}