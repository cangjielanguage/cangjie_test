// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'short'

func main(): Int64
{
    var uint32_One: UInt32 = short
    0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
