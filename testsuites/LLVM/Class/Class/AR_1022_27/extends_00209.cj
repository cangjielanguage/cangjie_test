// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class A {}

interface I{}

interface II{}

class B9 <: A & I , II{}

func main():Int64{
	return 0
}