// EXEC: %compiler -config="(test=true)" %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum when{e}

@when[test=="true"]
func main(){0}
