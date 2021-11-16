// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// RT: scan-not core dumped

func foo(): Char {
if true {
return 'a'
}
else {
return "hello"
}
}
func run():Int64{
if foo() =. 'a' {
return 0
}
return 1
}

func main(): Int64 {
return run()
}
