// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func run(): Int64 {
    var str: String = "中国"
    if (str.size() == 2){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
