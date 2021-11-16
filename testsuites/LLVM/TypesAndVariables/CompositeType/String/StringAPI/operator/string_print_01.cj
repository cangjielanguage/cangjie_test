// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex toStringTest:中国


func run(): Int64 {
    print("toStringTest:" + "中国")
    return 0
}

func main(): Int64 {
    return run()
}
