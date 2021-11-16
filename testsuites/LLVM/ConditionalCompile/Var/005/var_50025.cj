// ERRCHECK: %compiler -c %cmp_opt %f -o %output
// ASSERT: scan conditional compilation have not supported this condition: 'a'

@when[a!="1"]
func main(){0}

@when[a=="1"]
func main(){0}