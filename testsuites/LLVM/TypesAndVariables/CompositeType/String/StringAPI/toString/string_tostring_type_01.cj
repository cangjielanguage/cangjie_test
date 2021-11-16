// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex toStringTest:64

func run(): Int64 {
    var a : Int64 = 64
    print("toStringTest:" + a.toString())
    return 0
}

func main(): Int64 {
    return run()
}
