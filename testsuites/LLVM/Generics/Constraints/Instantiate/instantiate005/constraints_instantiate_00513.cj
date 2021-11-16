// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{}

interface B<X,Y,Z> where X <: A<Y*Z>, Y <: A<X*Z>, Z <: A<X*Y>{}

open class C <: A<C*C> & B<C,C,C>{}

func main():Int64{
    return 0
}
