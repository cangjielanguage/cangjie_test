// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait A{}

func test<X,Y>() where X <: X, Y <:Y{}

record R<X,Y> where X <: X, Y <:Y{}

enum E<X,Y> where X <: X, Y <:Y{e}

class C<X,Y> where X <: X, Y <:Y{}

interface I<X,Y> where X <: X, Y <:Y{}

trait R_X{}
append<X,Y> R<X,Y> with R_X where X <: X, Y <:Y{} 

func main():Int64{
    return 0
}
