// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait A{}

func test<X,Y>() where X <: Y, Y <:A{}

record R<X,Y> where X <: Y, Y <:A{}

enum E<X,Y> where X <: Y, Y <:A{e}

class C<X,Y> where X <: Y, Y <:A{}

interface I<X,Y> where X <: Y, Y <:A{}

trait R_X{}
append<X,Y> R<X,Y> with R_X where X <: Y, Y <:A{} 

func main():Int64{
    return 0
}
