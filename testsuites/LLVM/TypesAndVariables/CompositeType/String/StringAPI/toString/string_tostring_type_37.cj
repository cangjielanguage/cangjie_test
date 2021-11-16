// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex toStringTest:2

var range1 = 2..3: Int64(1)

func run(): Int64 {
    for (oneOfRange in range1) {
        print("toStringTest:" + oneOfRange.toString())
    }
    return 0
}

func main(): Int64 {
    return run()
}