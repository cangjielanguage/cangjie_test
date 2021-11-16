// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I<T>{}
interface J<T>{}
class A <: I<Int32> &J<Int32>{}


func main(){
    var a : I<Int32> = A()
    var b : J<Int32> = A()
    return 0
}