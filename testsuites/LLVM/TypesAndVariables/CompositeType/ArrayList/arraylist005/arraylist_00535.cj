// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I<T>{}

class C <: I<ArrayList<Unit>>{}

func main(): Int64 {
    C()
    return 0
}