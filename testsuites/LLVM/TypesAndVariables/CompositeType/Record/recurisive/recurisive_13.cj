// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f

record R{ //EXPECTED: regex value type recursive detected: 'R->R'
	R(var a: R ){
	
	}
}

func main(): Int64{
	return 2
}