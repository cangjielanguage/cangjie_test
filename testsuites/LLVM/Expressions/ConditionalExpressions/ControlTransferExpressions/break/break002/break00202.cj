// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var i : Int32 = 0
    while (i != 10) {
        break
        i ++
        if (i == 5) {
          break
        }
    }
    if (i == 0) {
        return 0
    }
    return 1
}
