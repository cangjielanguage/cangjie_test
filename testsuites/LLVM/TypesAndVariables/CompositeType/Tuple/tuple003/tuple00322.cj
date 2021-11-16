// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var MyTuple = (1,0)
    return MyTuple[1]
}
