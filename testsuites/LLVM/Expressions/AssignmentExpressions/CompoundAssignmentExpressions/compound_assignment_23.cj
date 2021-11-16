// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var a = 2
    while ( true ){
        a -=2
        if (a==0) {
            break
        }
    }
    return a
}