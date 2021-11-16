// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class X<T>{}
interface Y<T>{}

func test<T>() where T <: X<T>, T<: Y<T>{}

record R<T> where T <: X<T>, T<: Y<T>{}

enum E<T> where T <: X<T>, T<: Y<T>{e}

class C<T> where T <: X<T>, T<: Y<T>{}

interface I<T> where T <: X<T>, T<: Y<T>{}

trait R_X{}

append<T> R<T> with R_X where T <: X<T>, T<: Y<T>{}

func main():Int64{
    return 0
}
