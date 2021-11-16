// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<X> where X <: A<X>{}


interface C<X,Y> where X <: A<Y>, Y <: A<X>{}

class Z <: A<Z> &C<Z,Z>{}

func main():Int64{
    return 0
}
