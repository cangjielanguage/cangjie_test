// DEPENDENCE: test_20002.cj
// EXEC: %compiler %cmp_opt -c test_20002.cj -o when.%middle
// EXEC: %compiler -config="(test=true)" %cmp_opt when.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import when.*

@when[test=="true"]
func main(){0}
