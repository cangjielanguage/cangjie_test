// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex charTest: 麨

var c: Char = '\u{9EA8}'

func run(): Int64 {
    print("charTest: " + c.toString())
    return 0
}

func main(): Int64 {
    return run()
}