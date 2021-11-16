// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func run(): Int64 {
        
    var s1: String = ""
    var s2: String = "Aasdaaasdfaaa"
    var s3: String = "11168151991"
    var s4: String = "仓颉"
    var s5: String = "\n\t\b\\"
    var s6: String = "a1仓\n"
    

    if ("".count("") != 1 || s2.count("a") !=7 || s3.count("1") != 6)
    {
        return 1
    }
    if ("仓颉".count("编") != 0 || s5.count("\n") !=1 || s6.count("仓") != 1)
    {
        return 1
    }
    

return 0
}

func main(): Int64 {
    return run()
}