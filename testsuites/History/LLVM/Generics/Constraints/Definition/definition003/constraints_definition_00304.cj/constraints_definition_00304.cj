// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{}


func test<X,Y>() where X <: X, X <: A{}

record R<X,Y> where X <: X, X <: A{}

enum E<X,Y> where X <: X, X <: A{e}

class C<X,Y> where X <: X, X <: A{}

interface I<X,Y> where X <: X, X <: A{}

trait R_X{}
append<X,Y> R<X,Y> with R_X where X <: X, X <: A{} 

func main():Int64{
    return 0
}
