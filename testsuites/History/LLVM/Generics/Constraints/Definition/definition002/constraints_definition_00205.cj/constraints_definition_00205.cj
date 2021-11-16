// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{}

trait Y{}

func test<T>() where T <: T&Y{}

record R<T> where T <: T&Y{}

enum E<T> where T <: T&Y{e}

class C<T> where T <: T&Y{}

interface I<T> where T <: T&Y{}

append<T> R<T> with X where T<:T&Y{} 


func main():Int64{
    return 0
}
