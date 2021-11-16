// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type x = List<Int64>

func main(): Int64 {
    var a : x = []
    return a.size()
}
