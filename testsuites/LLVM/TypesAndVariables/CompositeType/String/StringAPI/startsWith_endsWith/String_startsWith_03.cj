// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1: String = ""
    var s2: String = "1_23"

    if (!s1.startsWith("")||s1.startsWith("8")||!s2.startsWith(""))
    {
        return 1
    }
    
return 0    
    
}

func main(): Int64 {
    return run()
}
