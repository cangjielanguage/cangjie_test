// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1: String = "Ab_bc"
    var s2: String = "1678_23"
    var s3: String = "仓_颉"
    var s4: String = "\tbng_\n\b"
    var s5: String = "A_bc1_23仓_颉\t_\n\b"
    
    if (!s1.startsWith("Ab")||!s2.startsWith("1678_")||!s3.startsWith("仓")
    ||!s4.startsWith("\tbng")||!s5.startsWith("A_"))
    {
        return 1
    }
    
    
return 0    
    
}

func main(): Int64 {
    return run()
}
