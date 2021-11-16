// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var set1 = @{1,2,3}
    set1[0]++
    set1[0]--
    print(set1[0].toString())
    if (set1[0] == 1) {
        return 0
    }
    return 1
}