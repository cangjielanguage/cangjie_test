// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<X,Y> where X<:A<X,X>,X<:B<Y,Y>, Y<:A<Y,Y>,Y<:B<X,X>{}
interface B<X,Y> where X<:A<X,X>,X<:B<Y,Y>, Y<:A<Y,Y>,Y<:B<X,X>{}


class C <: A<C,C> & B<C,C>{}

func main():Int64{
    return 0
}
