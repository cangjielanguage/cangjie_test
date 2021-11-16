// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
	var map4: Map<Char,Bool> = #{'a':true,'b':false,'c':true}
	var map5: Map<Char,Bool> = #{'c':true,'b':false,'a':true}
	if(map4 != map5) {
		return 1
	}
	return 0
}