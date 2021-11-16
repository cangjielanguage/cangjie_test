// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var str: String = ###" // EXPECTED: regex multi-line raw string literal is unterminated
Hello\\n
Char
"##

func run(): Int64 {
    print("StringTest: " + str)
    return 0
}

func main(): Int64 {
    return run()
}
