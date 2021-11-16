// EXEC: %compiler -config="(a=1,b=2,c=3)" %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@when[a!="1"&&(b!="2"||c=="3")]
func main(){1}

func main(){0}