// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I<T>{}
internal open class A{}
class B <: A & I<Int32>{}


func main(){
    var a : B
    return 0
}
