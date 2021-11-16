// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface A {}

interface I{}

interface II{}

interface B3 <: A > I{}

func main():Int64{
	return 0
}