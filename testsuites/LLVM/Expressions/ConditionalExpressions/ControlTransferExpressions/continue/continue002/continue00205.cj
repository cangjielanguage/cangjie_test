// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var i : Int32 = 0
    var j : Int32 = 0
    var k : Int32 = 0
    while (i != 10) {
        while (j != 10) {
            while (k != 10) {
                k++
                continue
                return 1
            }
            j++
        }
        i++
    }
    if (i != 10) {
        return 2
    }
    if (j != 10) {
        return 3
    }
    if (k != 10) {
        return 4
    }
    return 0
}
