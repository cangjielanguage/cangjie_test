// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A{}

func g<A>(a:A){return 0}

func main(){return g<Int64>(1)}