// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T> where T <: A<T>{}

interface B<T> <: A<B<T>>{}

class C <: B<C>{}

func main():Int64{
    return 0
}
