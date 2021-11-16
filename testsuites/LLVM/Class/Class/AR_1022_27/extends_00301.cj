// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class A {}

open class A1 {}

interface I{}

class B1 <: A & A1{ //EXPECTED: regex only one super class may appear in supertype list of class 'B1'

}

func main():Int64{
	return 0
}