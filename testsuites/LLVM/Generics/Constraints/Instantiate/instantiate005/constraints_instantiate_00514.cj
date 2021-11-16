// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<X,Y,Z>{}

interface B<X,Y,Z> <: A<X,Y,Z> where X <: A<X,X,X>, Y <: A<Y,Y,Y>, Z <: A<Z,Z,Z>{}

open class C <: B<C,C,C>{}

func main():Int64{
    return 0
}
