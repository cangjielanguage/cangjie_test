// ERRCHECK: %compiler %cmp_opt %n.cj -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func main(): Int64 {
var a:Float32 = NaN // EXPECTED: regex undeclared identifier 'NaN'
var b:Float32 = NaN // EXPECTED: regex undeclared identifier 'NaN'
if (a-b>0.0001) {
return 1
}
return 0
}
