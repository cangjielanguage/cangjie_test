// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{}
interface B<T> where T<:A<Option<T>>{}


class C <: A<Option<C>> & B<C>{}

func main():Int64{
    return 0
}
