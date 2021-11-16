// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<X>{}

interface B<X>{}

interface Z<X,Y> where X <: A<Y>, Y <: B<X>{}

open class C <: A<C> & B<C> & Z<C,C>{}

func main():Int64{
    return 0
}
