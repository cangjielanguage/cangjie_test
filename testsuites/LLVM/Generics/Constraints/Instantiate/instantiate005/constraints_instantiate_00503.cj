// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A{}

interface B{}

class C <: A & B{}

class Z<X,Y> where X <: A, Y <: B{}

func main():Int64{
    Z<C,C>()
    Z<A,B>()
    return 0
}
