// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{}

trait Y{}

func test<T>() where T <: X&X{}

record R<T> where T <: X&X{}

enum E<T> where T <: X&X{e}

class C<T> where T <: X&X{}

interface I<T> where T <: X&X{}

append<T> R<T> with X where T<:X&X{}

func main():Int64{
    return 0
}
