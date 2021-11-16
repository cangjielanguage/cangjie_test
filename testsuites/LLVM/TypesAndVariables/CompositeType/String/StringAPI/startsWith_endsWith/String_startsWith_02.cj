// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1: String = "A_bc"
    var s2: String = "1_23"
    var s3: String = "仓_颉"
    var s4: String = "\t_\n\b"
    var s5: String = "A_bc1_23仓_颉\t_\n\b"
    
    if (s1.startsWith("9")||s2.startsWith("19")||s3.startsWith("frawfgfareg9")
    ||s4.startsWith("\t9")||s5.startsWith("sfdgafdgasdf9"))
    {
        return 1
    }
    
    
return 0    
    
}

func main(): Int64 {
    return run()
}
