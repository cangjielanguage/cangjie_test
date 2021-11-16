// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex toStringTest:2

func foo(): Int32 {
    var a: Int32 = 2
    return a
}

func run(): Int64 {
    var a: Int32 = foo()
    print("toStringTest:" + a.toString())
    return 0
}

func main(): Int64 {
    return run()
}