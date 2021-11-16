// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a: Int32 = 2
    a **= 2+2
    if (a==16) {
        return 0
    }
    return 1
}