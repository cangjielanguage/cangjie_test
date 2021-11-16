// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait A<T> where T <: List<Int64>{}

append Int64 with A<List<Int64>>{}

func main(): Int64 {
    return 0
}
