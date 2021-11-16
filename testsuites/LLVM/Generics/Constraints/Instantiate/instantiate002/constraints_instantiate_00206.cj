// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A<T> where T <: A<T>{}

class AA <: A<AA>{}

func main():Int64{
    return 0
}
