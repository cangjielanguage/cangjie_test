// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex toStringTest:2

var array: Array<Int32> = @{1, 2, 3}

func run(): Int64 {
    print("toStringTest:" + array[1].toString())
    return 0
}

func main(): Int64 {
    return run()
}