// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
trait T{}

func test<X,Y>() where X <: Y{}

record R<X,Y> where X <: Y{}

enum E<X,Y> where X <: Y{e}

class C<X,Y> where X <: Y{}

interface I<X,Y> where X <: Y{}

append<X,Y> R<X,Y> with T where X <: Y{}

func main():Int64{
    test<Unit,Unit>()
    R<Unit,Unit>()
    E<Unit,Unit>.e
    C<Unit,Unit>()
    func foo(input:I<Unit,Unit>){}
    return 0
}
