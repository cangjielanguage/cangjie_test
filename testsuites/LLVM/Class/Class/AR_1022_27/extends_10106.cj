// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface A {}

interface B6 ^4: A {}

func main():Int64{
	return 0
}