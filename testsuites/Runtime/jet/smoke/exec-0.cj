// 'EXEC-0' will check return code of command 'a'.
// We only allow return code of 'a' be 0.

// EXEC-0: %compiler %cmp_opt %f -o %output
// EXEC-0: %run %run_opt %output %run_args

func main(){0}
