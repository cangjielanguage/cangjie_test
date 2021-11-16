// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var myTuple : Int64*Int64 = (1,0)
    var a = myTuple[0x1]
    return a
}
