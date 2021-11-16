// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{}

interface B<T> <: A<T> where T<:B<T>{}

class C <: B<C>{}

func main(){
    return 0
}