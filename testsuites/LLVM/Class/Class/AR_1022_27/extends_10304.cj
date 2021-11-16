// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class A {}

open class A1 {}

interface I{}

interface B4 & A <: I { //EXPECTED: regex expected '{' in interface

}

func main():Int64{
	return 0
}