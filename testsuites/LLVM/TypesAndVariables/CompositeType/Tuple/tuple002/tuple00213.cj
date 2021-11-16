// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var MyTuple = ((0,0),0)
    var ((a,b),c) = MyTuple
    return a
}
