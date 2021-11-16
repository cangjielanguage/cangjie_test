// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I<T>{}
open class A<T>{}
abstract class B<T> <: A<T> & I<T>{}


func main(){
    var a : B<Int32>
    return 0
}
