// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func main(): Int64{
var myArray = Array<Int32>( {  => },0) // EXPECTED: regex array size must be of type Int64
return 0
}
