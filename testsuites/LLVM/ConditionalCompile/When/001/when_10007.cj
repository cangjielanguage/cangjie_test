// DEPENDENCE: test_10007.cj
// EXEC: %compiler %cmp_opt -c test_10007.cj -o test.%middle
// EXEC: %compiler -config="(test=true)" %cmp_opt test.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

@when[test=="true"]
import test.*

@when[test=="true"]
func bar(){return foo()}

@when[test=="true"]
func main(){bar()}
