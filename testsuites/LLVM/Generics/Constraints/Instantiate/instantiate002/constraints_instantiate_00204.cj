// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<T> where T <: A<T>{}

interface B<T> where T <: B<T>{}

func main():Int64{
    return 0
}
