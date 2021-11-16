// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class B2 <: { //EXPECTED: regex expected type
	
}

func main():Int64{
	return 0
}