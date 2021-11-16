// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{}
interface B<T> where T<:A<Array<Unit>>{}


class C <: A<Array<Unit>> & B<C>{}

func main():Int64{
    return 0
}
