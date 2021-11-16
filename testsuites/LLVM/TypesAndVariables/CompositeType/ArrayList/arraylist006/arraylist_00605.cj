// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record C<T> where T <: ArrayList<Unit>{}

func main(): Int64 {
    C<ArrayList<Unit>>()
    return 0
}