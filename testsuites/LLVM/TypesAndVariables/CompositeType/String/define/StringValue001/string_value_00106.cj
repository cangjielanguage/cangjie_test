// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex StringTest: 

var str: String = """
"""

func run(): Int64 {
    print("StringTest: " + str)
    return 0
}

func main(): Int64 {
    return run()
}
