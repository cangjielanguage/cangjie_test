// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T> where T <: List<Int64>{}


func main(): Int64 {
    A<List<Int64>>()
    return 0
}
