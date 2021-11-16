// DEPENDENCE: test_10012.cj
// EXEC: %compiler -config="(test=true)" %cmp_opt -c test_10012.cj -o test.%middle
// EXEC: %compiler -config="(test=true)" %cmp_opt test.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

@when[test=="true"]
import test.foo as f

@when[test=="true"]
func bar(){return f()}

@when[test=="true"]
func main(){bar()}
