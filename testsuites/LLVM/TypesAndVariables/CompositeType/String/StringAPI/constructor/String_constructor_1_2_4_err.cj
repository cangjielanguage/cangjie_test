// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex IllegalArgumentException negative length
func run(): Int64 {
        

    var c2: Array<Char> = Array<Char>(['A','a','B','b','f','F'])

    
    var s22: String = String(c2).substring(3,-3)

return 0
}

func main(): Int64 {
    return run()
}
