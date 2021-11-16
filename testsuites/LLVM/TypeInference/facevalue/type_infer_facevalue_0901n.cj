// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

enum Test { Do | Ho }

func foo(): Int64 {
var test1 = match (Test.Do) { // EXPECTED: regex type incompatible in this MatchCase
case $Do => "a"
case $Ho => 'b'
}
var test2 = match (Test.Ho) { // EXPECTED: regex type incompatible in this MatchCase
case $Do => 'a'
case $Ho => "b"
}
if (test1 == "a" && test2 == "b") {
return 0
}
return 1
}

func main(): Int64 {
return foo()
}
