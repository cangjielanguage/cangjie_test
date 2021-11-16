// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{}

open class B<T> <: A<T> where T <: A<T>{}

class C <: A<C>{}

func main():Int64{
    B<C>()
    return 0
}
