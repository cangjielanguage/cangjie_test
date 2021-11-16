// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var res = 0
    var r1 = "".substring(0,0)
    if ( r1.size() !=  0){
        return 1
    }
    return 0
}
