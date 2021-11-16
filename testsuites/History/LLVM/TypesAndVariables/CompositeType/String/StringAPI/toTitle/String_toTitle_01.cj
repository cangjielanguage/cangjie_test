// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1: String = ""
    var s2: String = "abCdEf"
    var s3: String = "1234356"
    var s4: String = "仓颉"
    var s5: String = "\b\n\t"
    var s6: String = "abCdEf1234356仓颉\b\n\t"

    
    if (s1.toTitle()!=""||s2.toTitle()!="ABCDEF"||s3.toTitle()!="1234356")
    {
        return 1
    }
    if (s4.toTitle()!="仓颉"||s5.toTitle()!="\b\n\t"||s6.toTitle()!="ABCDEF1234356仓颉\b\n\t")
    {
        return 1
    }
    
return 0    
    
}

func main(): Int64 {
    return run()
}