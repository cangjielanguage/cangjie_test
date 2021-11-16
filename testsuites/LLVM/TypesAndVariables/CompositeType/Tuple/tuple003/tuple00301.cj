// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var myTuple : Int64*Int64 = (0,1)
    return myTuple[0]
}
