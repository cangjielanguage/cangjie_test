// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type x<T> = List<T>

func main(): Int64 {
    var a : x<Int64> = []
    return a.size()
}
