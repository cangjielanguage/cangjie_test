// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
var MyTuple = (
return 0,
return 1  // EXPECTED: regex expression of Nothing type cannot appear here currently
)
return 0
}
