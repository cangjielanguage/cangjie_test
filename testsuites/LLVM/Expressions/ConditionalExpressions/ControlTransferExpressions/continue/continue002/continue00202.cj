// EXEC: %compiler %cmp_opt %f -o %output
func main(): Int64 {
    var test : Int32 = 0
    while (test !=10) {
        continue
        test++
        return 1
    }
    return 0
}
