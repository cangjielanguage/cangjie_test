// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var i : Int32 = 0
    while (i != 10) {
        i ++
        if (i == 5) {
          break
          return 1
        }
    }
    if (i == 5) {
        return 0
    }
    return 1
}
