// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func foo(): Char {
if (true) {
return 'a'
}
else {
return "hello" // EXPECTED: regex type of return expression is incompatible with return type
}
}
func run():Int64{
if (foo() == 'a') {
return 0
}
return 1
}

func main(): Int64 {
return run()
}
