// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface B<X,Y,Z> where X <: B<X,Y,Z>, Y <: B<X,Y,Z>, Z <: B<X,Y,Z>{}

open class C <: B<C,C,C>{}

func main():Int64{
    return 0
}
