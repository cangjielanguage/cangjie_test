// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
var A : Int32 = 1

func g<A>(a:A){return 0}

func main(){return g<Int64>(1)}