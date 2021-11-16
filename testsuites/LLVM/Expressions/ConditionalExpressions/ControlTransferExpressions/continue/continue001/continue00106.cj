// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
var test : Int32 = 0
while (test !=10) {
test++
continue
@{
return 1 // EXPECTED: regex expression of Nothing type cannot appear here currently
}
}
return 0
}

