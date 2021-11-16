// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var MyTuple = (1,1)
    var (a,b) = MyTuple
    a = 0
    return a
}
