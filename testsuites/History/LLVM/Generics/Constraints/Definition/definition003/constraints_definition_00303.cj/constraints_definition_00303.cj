// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test<X,Y>() where X <: Y{}

record R<X,Y> where X <: Y{}

enum E<X,Y> where X <: Y{e}

class C<X,Y> where X <: Y{}

interface I<X,Y> where X <: Y{}

trait R_X{}
append<X,Y> R<X,Y> with R_X where X <: Y{} 

func main():Int64{
    return 0
}
