// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex StringTest: Hello Char\'Lang

var str: String = "Hello Char\'Lang"

func run(): Int64 {
    print("StringTest: " + str)
    return 0
}

func main(): Int64 {
    return run()
}