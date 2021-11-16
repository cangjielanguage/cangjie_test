// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1: String = "A_bc"

    
    var cs1 = s1.split("_",-10)

    if (cs1[0] == "A" && cs1[1] == "bc")
    {
        return 0
    }
    
return 1    
    
}

func main(): Int64 {
    return run()
}
