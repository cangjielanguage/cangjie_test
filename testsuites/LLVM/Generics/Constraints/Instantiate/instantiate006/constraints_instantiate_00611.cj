// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{}
interface B<T> where T<:A<T*T>{}


class C <: A<C*C> & B<C>{}

func main():Int64{
    return 0
}
