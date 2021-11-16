// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface B<T> where T <: B<T>{}

class BB <: B<BB>{}

func main():Int64{
    return 0
}
