// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class X<A,B>{}
interface Y<A,B>{}

func test<T>() where T <: X<T,T>, T <: Y<T,T>{}

record R<T> where T <: X<T,T>, T <: Y<T,T>{}

enum E<T> where T <: X<T,T>, T <: Y<T,T>{e}

class C<T> where T <: X<T,T>, T <: Y<T,T>{}

interface I<T> where T <: X<T,T>, T <: Y<T,T>{}

trait R_X{}

append<T> R<T> with R_X where T <: X<T,T>, T <: Y<T,T>{}

func main():Int64{
    return 0
}
