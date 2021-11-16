// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

external interface I<T>{}
external interface J<T> <: I<T>{}
open external class A<T>{}
external class B<T> <: A<T> & I<T> &J<T>{}


func main(){
    var a : B<Int32> = B<Int32>()
    return 0
}
