// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex-not no matching function declaration for function call 'super'

var I = 9

interface B1 <: I{ //EXPECTED: regex interface 'B1' can only inherit interface

}

func main():Int64{
	return 0
}