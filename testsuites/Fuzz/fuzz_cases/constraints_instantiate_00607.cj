// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface A<X,Y> where X<:A<X,X>,X<:B<Y,Y>, Y<:A<Y,Y>,Y<:B<X,X>{}
interface B<X,Y> where X<:A<,X>,X,X>,X,X>,X,X>,X,X>,X,X>,X,X>,X<:B<Y,Y>, Y<:A<Y,Y>,Y<:B<X,X>{}


class C <: A<C,C> & B<C,C>{}

func main():Int64{
    return 0
}