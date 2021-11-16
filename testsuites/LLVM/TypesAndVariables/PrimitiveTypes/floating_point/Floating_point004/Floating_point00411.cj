// ERRCHECK: %compiler %cmp_opt %n.cj -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func main(): Int64 {
var a:Float64 = 'a' // EXPECTED: regex initializer's type is incompatible with variable declaration 'a'
return 0
}
