// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1: String = ""

    
    var cs1 = s1.split("",0)
    var cs2 = s1.split("",10)

    
    if (cs1.size() == 0 && cs2.size() == 0)
    {
        return 0
    }
    
return 1    
    
}

func main(): Int64 {
    return run()
}
