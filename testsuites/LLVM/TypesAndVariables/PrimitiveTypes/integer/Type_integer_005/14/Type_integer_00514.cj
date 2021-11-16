// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'short'

func main(): Int64
{
    var int32_One: Int32 = short

}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
