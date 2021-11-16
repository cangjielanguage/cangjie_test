// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
let letString : String = "let"
letString = "LET" // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
if (letString == "LET") {
return 1
}
return 0
}
