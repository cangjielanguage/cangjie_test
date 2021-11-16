// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<X,Y> where X <: A<X,Y>, Y<: A<X,Y>{}

open class C <: A<C,C>{}

func main():Int64{
    return 0
}
