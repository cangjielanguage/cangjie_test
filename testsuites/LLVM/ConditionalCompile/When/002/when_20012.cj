// EXEC: %compiler -config="(test=true)" %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func when(){}

@when[test=="true"]
func main(){0}
