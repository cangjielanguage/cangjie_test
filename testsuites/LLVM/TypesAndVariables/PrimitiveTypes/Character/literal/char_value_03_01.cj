// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex empty character is not allowed

var c: Char = ''

func run(): Int64 {
print("charTest: " + c.toString() + "!")
return 0
}

func main(): Int64 {
return run()
}
