// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var i : Int64 = 0
    do {
        if (i < 5) {
            i = i + 1
            continue
        }
        break
    } while (true)
    return 5 - i
}
