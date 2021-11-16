// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex IndexOutOfBoundsException

func run(): Int64 {
    var c1 : Array<Char> = Array<Char>(['A','a','B','b','f','F','0'])
    var s1: String = String(c1).substring(4,5)
    return 0
}

func main(): Int64 {
    return run()
}
