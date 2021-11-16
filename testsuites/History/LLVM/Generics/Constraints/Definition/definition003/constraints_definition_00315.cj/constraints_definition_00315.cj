// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait A{}

func test<X,Y>() where X <: Y, Y <:X{}

record R<X,Y> where X <: Y, Y <:X{}

enum E<X,Y> where X <: Y, Y <:X{e}

class C<X,Y> where X <: Y, Y <:X{}

interface I<X,Y> where X <: Y, Y <:X{}

trait R_X{}
append<X,Y> R<X,Y> with R_X where X <: Y, Y <:X{} 

func main():Int64{
    return 0
}
