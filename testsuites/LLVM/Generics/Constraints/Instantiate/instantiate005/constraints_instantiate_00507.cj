// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<X> where X <: B<X>{}

interface B<X> where X <: A<X>{}

interface C<X,Y> where X <: A<Y>, Y <: B<X>{}

class Z <: A<Z> & B<Z> & C<Z,Z>{}

func main():Int64{
    return 0
}
