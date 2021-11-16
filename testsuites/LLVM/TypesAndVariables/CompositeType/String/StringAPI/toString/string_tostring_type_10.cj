// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex toStringTest:3.200000\n

func run(): Int64 {
    var a : Float32 = 3.2
    print("toStringTest:" + a.toString()+"\n")
    return 0
}

func main(): Int64 {
    return run()
}
