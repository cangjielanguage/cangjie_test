// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{}

func test<T>() where T <: T{}

record R<T> where T <: T{}

enum E<T> where T <: T{e}

class C<T> where T <: T{}

interface I<T> where T <: T{}

append<T> R<T> with X where T <: T{} 

func main():Int64{
    test<Unit>()
    R<Unit>()
    E<Unit>.e
    C<Unit>()
    func foo(input:I<Unit>){}
    return 0
}
