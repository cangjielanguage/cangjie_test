// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var MyTuple : Option<Int32>*Option<Int32> = (Some<Int32>(100),Some<Int32>(100))
    return 0
}
