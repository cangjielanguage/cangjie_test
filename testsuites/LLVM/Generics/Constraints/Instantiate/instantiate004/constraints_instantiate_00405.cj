// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface X<T> where T <: Y<T>, T <: Z<T>{}
interface Y<T> where T <: X<T>, T <: Z<T>{}
interface Z<T> where T <: X<T>, T <: Y<T>{}

interface C <: X<C> & Y<C> & Z<C>{}

func main():Int64{
    return 0
}
