// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type A = Int32

interface I<A>{}

func main(){return 0}