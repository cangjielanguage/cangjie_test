// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
external open class Father{}
external class Child <: Father{}

external interface I<T>{
    func foo(a:T):Father{return Father()}
}

external interface J<T>{
    func foo(a:T):Child{return Child()}
}

open external class A<T>{}

external class B<X,Y,Z> <: A<Int32> & I<Int8> &J<Int16>{
    func foo(a:Int16):Child{return Child()}
    func foo(a:Int8):Father{return Father()}
}


func main(){
    var a : B<Int8,Int16,Int32> = B<Int8,Int16,Int32>()
    return 0
}
