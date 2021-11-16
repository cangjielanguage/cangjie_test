// ERRCHECK: %compiler %cmp_opt %n.cj -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func main(): Int64 {
var a:Float64 = Float64 // EXPECTED: regex expected expression here
var b:Float64 = 1.5
if (a-b>0.0001) {
return 1
}
return 0
}
