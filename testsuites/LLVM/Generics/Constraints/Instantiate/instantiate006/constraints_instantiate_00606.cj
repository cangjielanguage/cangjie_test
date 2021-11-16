// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<X,Y> where X<:A<X,Y>,X<:B<X,Y>, Y<:A<X,Y>,Y<:B<X,Y>{}
interface B<X,Y> where X<:A<X,Y>,X<:B<X,Y>, Y<:A<X,Y>,Y<:B<X,Y>{}


class C <: A<C,C> & B<C,C>{}

func main():Int64{
    return 0
}
