// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args 

func main(): Int64 {
    var res1 = "abcdb"[0..3:2]
    if ( res1 != "ac" ){
        return 1
    }
    return 0
}
