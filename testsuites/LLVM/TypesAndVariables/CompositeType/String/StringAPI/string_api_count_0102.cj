// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var res = 0
    var r1 = "abcac".count("")
    if ( r1 != 6){
        return 1
    }
    return 0
}
