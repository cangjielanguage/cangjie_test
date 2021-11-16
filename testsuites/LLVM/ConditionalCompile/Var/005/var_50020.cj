// ERRCHECK: %compiler -config="(a=)" %cmp_opt %f -o %output
// ASSERT: scan user defined condition should have 'key' and 'value'

@when[a!="1"]
func main(){0}

@when[a=="1"]
func main(){0}