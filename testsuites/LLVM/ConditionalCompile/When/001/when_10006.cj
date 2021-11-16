// EXEC: %compiler -config="(test=true)" %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@when[test=="true"]
from std import math.*

@when[test=="true"]
func test(){var a = NaN64;0}

@when[test=="true"]
func main(){test()}