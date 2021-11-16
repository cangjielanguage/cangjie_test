// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var i : Int32 = 0
    var j : Int32 = 0
    while (i != 10) {
        while (j != 10) {
          j++
          continue
          return 1
        }
        i++
    }
    if (i != 10) {
        return 2
    }
    if (j != 10) {
        return 3
    }
    return 0
}
