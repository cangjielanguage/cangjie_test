// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: scan too many characters between ''
// ASSERT: scan too many characters between ''

func main(): Int64 {
var ch1 = '-1'

if (ch1.toAsciiUpperCase() != '-1')
{
return 1
}

return 0
}
