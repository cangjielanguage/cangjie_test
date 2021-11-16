// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1

func run(): Int64 {
    var str1 = "a"
    var str2 = "b"
    if (str2 > str1){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}