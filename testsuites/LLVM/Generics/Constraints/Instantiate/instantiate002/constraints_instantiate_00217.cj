// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{}

interface B<T> where T<:A<T>{}

class C<T> <: A<T> &B<T> where T<:A<T>{}

class D <: A<D>{}

func main(){
    C<D>()
    return 0
}