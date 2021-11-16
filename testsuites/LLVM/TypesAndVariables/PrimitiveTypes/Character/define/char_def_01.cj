// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex characterTest: a

var c: Char = 'a'

func run(): Int64 {
    print("characterTest: " + c.toString())
    return 0
}

func main(): Int64 {
    return run()
}