// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args


var map01 = Map<Int64,Int64>()
func main(): Int64 {
    if (map01.size() == 0){
        return 0
    }
    return 1
}