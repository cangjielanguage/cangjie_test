// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<X>{}

interface B<X>{}

class Z<X,Y> where X <: A<X>, Y <: B<X>{}

open class C <: A<C> & B<C>{}

func main():Int64{
    Z<C,C>()
    return 0
}
