// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1

func run(): Int64 {
    var str1 = "1"
    var str2 = "2"
    if (str1 < str2){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}