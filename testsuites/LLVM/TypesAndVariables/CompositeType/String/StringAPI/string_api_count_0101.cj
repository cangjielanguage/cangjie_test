// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var str2 = ""
    var res1 = str2.count("a")
    var res2 = str2.count("")
    if ( res1 != 0 ){
        return 1
    }
    if ( res2 != 1 ){
        return 2
    }
    return 0
}
