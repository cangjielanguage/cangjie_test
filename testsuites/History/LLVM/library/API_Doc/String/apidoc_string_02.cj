// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var str = "仓颉"
    for ( c in str ){
        print("${c}\n")
    }
    var res = 0
    return 0
}

