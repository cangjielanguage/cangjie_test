// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex StringTest: Hello\nChar\n Lang

var str: String = """
Hello
Char\n Lang
"""

func run(): Int64 {
    print("StringTest: " + str)
    return 0
}

func main(): Int64 {
    return run()
}