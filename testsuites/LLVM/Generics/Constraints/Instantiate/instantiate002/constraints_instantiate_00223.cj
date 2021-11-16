// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T> where T<:B<T>{}
interface B<T> where T<:A<T>{}

open class C<T> <: A<C<T>> &B<C<T>>{}

class D <: C<D>{}

func main(){
    return 0
}