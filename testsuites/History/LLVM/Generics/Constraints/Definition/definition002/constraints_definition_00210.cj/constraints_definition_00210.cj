// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{}
class Y{}
interface Z{}

func test<T>() where T <: X&Y&Z{}

record R<T> where T <: X&Y&Z{}

enum E<T> where T <: X&Y&Z{e}

class C<T> where T <: X&Y&Z{}

interface I<T> where T <: X&Y&Z{}

append<T> R<T> with X where T<:X&Y&Z{}

func main():Int64{
    return 0
}
