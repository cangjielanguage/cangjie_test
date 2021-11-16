// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E{
    e(?Int64)
}

func main(): Int64 {
    e(1)
    return 0
}