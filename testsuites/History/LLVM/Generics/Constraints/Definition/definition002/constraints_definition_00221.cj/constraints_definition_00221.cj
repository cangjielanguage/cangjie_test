// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class X<A,B>{}

func test<T>() where T <: X<T,Int32>, T <: X<Int32,T>{}

record R<T> where T <: X<T,Int32>, T <: X<Int32,T>{}

enum E<T> where T <: X<T,Int32>, T <: X<Int32,T>{e}

class C<T> where T <: X<T,Int32>, T <: X<Int32,T>{}

interface I<T> where T <: X<T,Int32>, T <: X<Int32,T>{}

trait R_X{}

append<T> R<T> with R_X where T <: X<T,Int32>, T <: X<Int32,T>{}

func main():Int64{
    return 0
}
