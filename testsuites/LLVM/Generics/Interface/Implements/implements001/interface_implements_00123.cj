// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

external interface I<T>{}
external abstract class A<T>{}
external class B<T> <: A<T> & I<T>{}


func main(){
    var a : B<Int32>
    return 0
}
