// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1: String = "he_ll_o"
    var s2  = s1.split("")
    
    if (s2[0] == "h"&&s2[1]=="e"&&s2[2]=="_"&&s2[3]=="l"
        &&s2[4]=="l"&&s2[5]=="_"&&s2[6]=="o")
    {
        return 0
    }


return 1    
    
}

func main(): Int64 {
    return run()
}
