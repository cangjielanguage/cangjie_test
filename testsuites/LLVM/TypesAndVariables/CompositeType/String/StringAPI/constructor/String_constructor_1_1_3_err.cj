// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex IndexOutOfBoundsException

func run(): Int64 {
        
    var c6: Array<Char> = Array<Char>(['仓','颉','b','f','F','3','7','9'])
    
    var s6: String = String(c6).substring(88)
    
    print("s6=" + s6 + "\n")

return 0
}

func main(): Int64 {
    return run()
}
