// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class X<T>{}
interface Y<T>{}

func test<T>() where T <: X<T>, T <: X<Int32>{}

record R<T> where T <: X<T>, T <: X<Int32>{}

enum E<T> where T <: X<T>, T <: X<Int32>{e}

class C<T> where T <: X<T>, T <: X<Int32>{}

interface I<T> where T <: X<T>, T <: X<Int32>{}

trait R_X{}

append<T> R<T> with R_X where T <: X<T>, T <: X<Int32>{}

func main():Int64{
    return 0
}
