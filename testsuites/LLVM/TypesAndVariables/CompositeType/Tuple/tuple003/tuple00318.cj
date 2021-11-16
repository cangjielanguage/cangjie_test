// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var myTuple = ((1,2),(3,4))
    var a = myTuple[1][1]
    if (a != 4) {
      return a
    }
    return 0
}
