// ERRCHECK: %compiler %cmp_opt %n.cj -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
var t:Bool = true
var f:Bool = false
if (f &&& f) { //EXPECTED: regex expected expression here
return 1
}
if (f &&& t) {
return 1
}
return 0
}
