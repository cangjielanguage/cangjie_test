// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A1<T>{}
interface A2<T>{}
interface A3<T>{}

interface B<X,Y,Z> <: A1<X> & A2<Y> & A3<Z>{}

func main(){
    return 0
}