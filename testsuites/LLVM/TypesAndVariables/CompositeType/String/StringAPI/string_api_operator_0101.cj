// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var str2 = ""
    try {
       var res2 = str2[0]
    } catch ( e:IndexOutOfBoundsException ){
       return 0
    }
    return 1
}
