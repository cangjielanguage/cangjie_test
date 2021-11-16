// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface X<T>{}
interface Y<T>{}
interface Z<T> <: X<T> &Y<T> where T<:X<T>, T<:Y<T>{}

interface C <: Z<C>{}

func main():Int64{
    return 0
}
