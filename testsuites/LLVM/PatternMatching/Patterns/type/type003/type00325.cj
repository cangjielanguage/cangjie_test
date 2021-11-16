// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
func test(): Int64 {
var i : Int32 = 1
let j : Int32 = 1
var res = match (i) { // EXPECTED: regex-auto at least one default case, such as wildcard pattern, variable pattern or '[...]' for sequence pattern in match case
case a : Int8 => 2
case $j => 1
}
if (res == 1) {
return 0
}
return 1
}

func main(): Int64 {
return test()
}
