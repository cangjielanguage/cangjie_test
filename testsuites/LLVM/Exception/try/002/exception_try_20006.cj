// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<T> <: Exception{}

func main(){
    try{throw A<Int64>()}
    catch (a:A<Int64>) {return 0}
    finally{}
    return 1
}