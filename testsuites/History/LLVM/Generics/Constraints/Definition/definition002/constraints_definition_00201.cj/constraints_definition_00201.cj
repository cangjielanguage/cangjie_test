// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{}

trait Y{}

func test<T>() where T <: X&Y{}

record R<T> where T <: X&Y{}

enum E<T> where T <: X&Y{e}

class C<T> where T <: X&Y{}

interface I<T> where T <: X&Y{}

append<T> R<T> with X where T<:X&Y{} 

func main():Int64{
    return 0
}
