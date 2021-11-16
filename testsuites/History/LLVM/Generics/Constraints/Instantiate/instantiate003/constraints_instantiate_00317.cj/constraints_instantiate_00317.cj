// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface Y<T>{}

interface X<T>{}

class Z<T> <: X<T> & Y<T>{}

func test<T>() where T <: X<Int32>, T <: Y<Int32>{}

record R<T> where T <: X<Int32>, T <: Y<Int32>{}

enum E<T> where T <: X<Int32>, T <: Y<Int32>{e}

class C<T> where T <: X<Int32>, T <: Y<Int32>{}

interface I<T> where T <: X<Int32>, T <: Y<Int32>{}

trait R_X{ func bar(a:This):Unit }

record R2<T>{}

append<T> R2<T> with R_X where T <: X<Int32>, T <: Y<Int32>{ func bar(a:R2<T>){} }

func main():Int64{
    test<Z<Int32>>()
    R<Z<Int32>>()
    bar(R2<Z<Int32>>())
    E<Z<Int32>>.e
    C<Z<Int32>>()
    func foo(a:I<Z<Int32>>){}
    return 0
}
