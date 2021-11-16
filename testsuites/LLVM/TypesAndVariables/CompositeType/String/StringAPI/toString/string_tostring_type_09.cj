// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex toStringTest:6.400000\n

func run(): Int64 {
    var a : Float64 = 6.4
    print("toStringTest:" + a.toString()+"\n")
    return 0
}

func main(): Int64 {
    return run()
}
