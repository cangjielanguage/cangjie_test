// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
type A=Int32

func g<A>(a:A){return 0}

func main(){return g<Int64>(1)}
