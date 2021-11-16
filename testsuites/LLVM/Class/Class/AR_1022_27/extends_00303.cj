// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class A {}

open class A1 {}

interface I{}

class B3 <: I & A{ //EXPECTED: regex super class 'A' must be placed at the beginning of supertype list
}

func main():Int64{
	return 0
}