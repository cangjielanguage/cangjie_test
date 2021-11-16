// ERRCHECK: %compiler -config="a=1" %cmp_opt %f -o %output
// ASSERT: scan user defined condition should have matched '()'

@when[a!="1"]
func main(){0}

@when[a=="1"]
func main(){0}