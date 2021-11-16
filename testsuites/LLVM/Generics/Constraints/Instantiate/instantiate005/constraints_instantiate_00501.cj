// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{}

interface B{}


class Z<X,Y> where X <: A, Y <: B{}

func main():Int64{
    Z<A,B>()
    return 0
}
