// 'EXEC' equals to 'EXEC-0'.
// 'EXEC-0' will check return code of command 'a'.
// We only allow return code of 'a' be 0.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){0}
