// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var i : Int32 = 0
    var j : Int32 = 0
    var k : Int32 = 0
    while (i != 10) {
        i ++
        while (j!= 10) {
            j ++
            while (k != 10) {
                break
            }
        }
    }
    if (k != 0) {
        return 1
    }
    if (i != 10) {
        return 1
    }
    if (j != 10) {
        return 1
    }
    return 0
}
