// DEPENDENCE: test_20003.cj
// EXEC: %compiler %cmp_opt -c test_20003.cj -o test.%middle
// EXEC: %compiler -config="(test=true)" %cmp_opt test.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

@when[test=="true"]
func main(){0}
