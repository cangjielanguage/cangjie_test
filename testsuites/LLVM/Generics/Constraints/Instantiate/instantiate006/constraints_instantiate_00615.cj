// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{}
type mytype = A<Int32>
interface B<T> where T<:mytype{}


class C <: A<Int32> & B<C>{}

func main():Int64{
    return 0
}
