// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var MyTuple = (if (true) {0}, if (false) {0} else{1})
    return 0
}
