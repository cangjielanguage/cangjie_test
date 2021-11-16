// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    while (false) {
      var MyTuple = (
        1,
        while (true) {1}
     )
    }
    return 0
}
