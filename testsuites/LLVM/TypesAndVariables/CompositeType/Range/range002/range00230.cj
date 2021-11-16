// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func main(): Int64 {
var range1 = -111111111111111111111..11111111111111111111:1111111111111111 // EXPECTED: regex the number '-111111111111111111111' exceeds the value range of type 'Int64'
return 0
}
