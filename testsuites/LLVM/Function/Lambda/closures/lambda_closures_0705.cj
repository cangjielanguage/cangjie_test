// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args


var f1 = if ( true ){
    var a = 1
    var x3 = {a}()
}

func main(): Int64{
	if( f1 == ()){
		return 0
	}
	return 1
}