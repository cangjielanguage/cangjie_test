// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface B<X,Y,Z> where
X<:B<X,X,X>,X<:B<Y,Y,Y>,X<:B<Z,Z,Z>,
Y<:B<X,X,X>,Y<:B<Y,Y,Y>,Y<:B<Z,Z,Z>,
Z<:B<X,X,X>,Z<:B<Y,Y,Y>,Z<:B<Z,Z,Z>
{}

class C <: B<C,C,C>{}

func main():Int64{
    return 0
}
