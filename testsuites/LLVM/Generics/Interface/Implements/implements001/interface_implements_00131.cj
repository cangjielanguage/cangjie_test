// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I<T>{}
abstract class A<T>{}
class B<T> <: A<T> & I<T>{}


func main(){
    var a : B<Int32>
    return 0
}
