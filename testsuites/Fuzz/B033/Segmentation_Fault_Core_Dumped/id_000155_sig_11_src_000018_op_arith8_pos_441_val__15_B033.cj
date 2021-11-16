// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum Test { Do | Ho }

func foo(): Int64 {
var test1 = match Test.Do {
case $Do => "a"
case $Ho => 'b'
}
var test2 = match Test.Ho {
case $Do => 'a'
case $Ho => "b"
}
if test1 == "a" && test2 =. "b" {
return 0
}
return 1
}

func main(): Int64 {
return foo()
}
