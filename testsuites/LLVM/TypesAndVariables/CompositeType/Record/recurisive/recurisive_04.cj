// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f

record R{
	var a: R2 
}

record R2{ //EXPECTED: regex value type recursive detected: 'R2->R->R2'
	var a: R
	var a2: R3
}

record R3{ //EXPECTED: regex value type recursive detected: 'R3->R2->R3'
	var a: R2
}

func main(): Int64{
	return 2
}