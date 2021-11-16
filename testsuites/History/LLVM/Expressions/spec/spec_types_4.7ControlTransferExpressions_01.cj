// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return return 1 // EXPECTED: regex warning.*?the left return expression is unreachable
}


