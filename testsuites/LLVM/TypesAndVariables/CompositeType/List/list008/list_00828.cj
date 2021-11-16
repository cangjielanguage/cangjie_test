// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


var a = { input:List<Int64> => input}

func main(): Int64 {
    return a([0]).size() - 1
}
