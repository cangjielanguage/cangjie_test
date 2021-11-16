// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func g<T>(a:T):T{a}

func main(){return 0}