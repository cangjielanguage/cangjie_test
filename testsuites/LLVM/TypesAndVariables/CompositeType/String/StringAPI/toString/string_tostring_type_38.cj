// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex toStringTest:3

var tup: Int32*Int32 = (3, 4)

func run(): Int64 {
    print("toStringTest:" + tup[0].toString())
    return 0
}

func main(): Int64 {
    return run()
}