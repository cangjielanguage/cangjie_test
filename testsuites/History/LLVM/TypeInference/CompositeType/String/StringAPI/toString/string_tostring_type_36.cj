// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex toStringTest:50.000000\n

var listf64: ListFloat64 = ListFloat64(10,50.0)

func run(): Int64 {
    print("toStringTest:" + listf64.get(0).toString()+"\n")
    return 0
}

func main(): Int64 {
    return run()
}
