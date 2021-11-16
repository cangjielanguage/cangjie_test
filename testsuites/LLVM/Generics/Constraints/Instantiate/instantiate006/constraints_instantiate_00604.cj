// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{}

interface B<X,Y,Z> where
X<:A<X>,X<:A<Y>,X<:A<Z>,
Y<:A<X>,Y<:A<Y>,Y<:A<Z>,
Z<:A<X>,Z<:A<Y>,Z<:A<Z>
{}

class C <: A<C> & B<C,C,C>{}

func main():Int64{
    return 0
}
