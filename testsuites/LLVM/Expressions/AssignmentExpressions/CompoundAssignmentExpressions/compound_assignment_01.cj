// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64{
    var a = 2
    var b = 2
    var x = (a **= b)
    a **= 2
    if ( a == 16) {
        return 0
    }
    return 1
}