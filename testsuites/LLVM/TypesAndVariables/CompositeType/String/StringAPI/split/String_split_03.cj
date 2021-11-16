// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1: String = "he_l"
    var s2  = s1.split("M")
    
    if (s2.size() == 1 && s2[0] == "he_l")
    {    
        return 0
    }

return 1    
    
}

func main(): Int64 {
    return run()
}
