// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var myTuple = (9,8,7,6,5,4,3,2,1,0,0)
    var a = myTuple[1_0]
    return a
}
