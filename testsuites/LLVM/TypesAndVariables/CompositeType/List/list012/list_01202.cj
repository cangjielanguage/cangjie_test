// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// spread机制  int < int
func main(): Int64 {
    var a:List<Int32> = [3,4]
    var b:List<Int32> = [1,2,*a,5,6]
    if (b[3] == 4 ) {
        return 0
    }
    return 1
}
