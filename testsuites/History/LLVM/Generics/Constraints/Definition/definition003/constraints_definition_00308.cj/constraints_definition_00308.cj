// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{}

class B{}

func test<X,Y>() where X <: A, X <: B{}

record R<X,Y> where X <: A, X <: B{}

enum E<X,Y> where X <: A, X <: B{e}

class C<X,Y> where X <: A, X <: B{}

interface I<X,Y> where X <: A, X <: B{}

trait R_X{}
append<X,Y> R<X,Y> with R_X where X <: A, X <: B{} 

func main():Int64{
    return 0
}
