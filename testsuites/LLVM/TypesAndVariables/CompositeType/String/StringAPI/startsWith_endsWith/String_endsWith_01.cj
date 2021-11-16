// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1: String = "A_bcAasdgasg"
    var s2: String = "1_231458784634"
    var s3: String = "仓_颉编程测试桌子椅子手机"
    var s4: String = "\t_\nsagag\b"
    var s5: String = "A_bc1_23仓_颉\t_\nB"
    
    if (!s1.endsWith("g")||!s2.endsWith("8784634")||!s3.endsWith("子手机")
    ||!s4.endsWith("gag\b")||!s5.endsWith("_颉\t_\nB"))
    {
        return 1
    }
    
    
return 0    
    
}

func main(): Int64 {
    return run()
}
