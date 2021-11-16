// 'EXEC--123' will check return code of command 'a'.
// We only allow return code of 'a' be -123.

// EXEC-0: %compiler %cmp_opt %f -o %output
// EXEC--123: %run %run_opt %output %run_args

func main(){-123}
