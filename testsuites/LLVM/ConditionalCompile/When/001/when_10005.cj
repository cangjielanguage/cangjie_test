// EXEC: %compiler -config="(test=true)" %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func foo(){
@when[test=="true"]
func bar(){}
return 0
}

func main():Int64{
    return foo()
}


