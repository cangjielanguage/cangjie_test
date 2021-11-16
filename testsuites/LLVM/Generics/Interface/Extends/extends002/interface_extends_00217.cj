// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<T>{}

interface B<X,Y,Z> <: A<X> & A<Y> & A<Z>{}

func main(){
    return 0
}