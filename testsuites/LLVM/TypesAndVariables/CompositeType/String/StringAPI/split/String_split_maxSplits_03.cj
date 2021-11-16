// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1: String = "A_b"
    var s2: String = "123"
    var s3: String = "仓颉"
    var s4: String = "\t\b\n"
    var s5: String = "*\t\bA_1"

    var cs1 = s1.split("W",3)
    var cs2 = s2.split("Q",2)
    var cs3 = s3.split("R",10)
    var cs4 = s4.split("X",5)
    var cs5 = s5.split("T",3)
    
    if (cs1[0]!="A_b")
    {
        return 1
    }
    if (cs2[0]!="123" )
    {
        return 1
    }
    if (cs3[0]!="仓颉")
    {
        return 1
    }
    if (cs4[0]!="\t\b\n" )
    {
        return 1
    }
    if (cs5[0]!="*\t\bA_1" )
    {
        return 1
    }
    
    
return 0    
    
}

func main(): Int64 {
    return run()
}
