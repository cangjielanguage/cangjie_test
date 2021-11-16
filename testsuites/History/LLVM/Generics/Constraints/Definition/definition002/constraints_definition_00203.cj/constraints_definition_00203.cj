// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{}

trait Y{}

func test<T>() where T <: T&T{}

record R<T> where T <: T&T{}

enum E<T> where T <: T&T{e}

class C<T> where T <: T&T{}

interface I<T> where T <: T&T{}

append<T> R<T> with X where T<:T&T{} 


func main():Int64{
    test<Int8>()
    return 0
}
