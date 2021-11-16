// ERRCHECK: %compiler -config="(test=true)" %cmp_opt %f -o %output
// ASSERT: scan package 'x/xxx' is not found

@when[test=="true"]
from x import xxx

@when[test=="true"]
func bar(){return 1}

@when[test=="true"]
func main(){bar()}