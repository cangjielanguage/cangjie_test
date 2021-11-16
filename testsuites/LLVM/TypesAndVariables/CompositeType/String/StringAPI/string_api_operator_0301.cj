// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var str2 = ""
    var res1 = str2*2
    if ( res1 != "" ){
        return 1
    }
    return 0
}

