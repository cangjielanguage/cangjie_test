// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex charTest: a

var a: Char = 'a'

func run(): Int64 {
    print("charTest: " + a.toString())
    return 0
}

func main(): Int64 {
    return run()
}