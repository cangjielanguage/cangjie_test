// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface X<T> where T <: Y<T>{}
interface Y<T> where T <: X<T>{}

open class Z<T> where T <: X<T> , T <: Y<T>{}

class C <: Z<C> & X<C> & Y<C>{}

func main():Int64{
    return 0
}
