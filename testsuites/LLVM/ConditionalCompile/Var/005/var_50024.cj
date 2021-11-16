// ERRCHECK: %compiler -config="(a=1 b=2)" %cmp_opt %f -o %output
// ASSERT: scan user defined condition should be like : k1=v1,k2=v2

@when[a!="1"]
func main(){0}

@when[a=="1 b=2"]
func main(){0}