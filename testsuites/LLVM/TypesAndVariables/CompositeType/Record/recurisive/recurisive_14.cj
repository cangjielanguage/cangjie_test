// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record R{
	R(a: R){
	
	}
}

func main(): Int64{
	return 0
}