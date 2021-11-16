// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var i = 0
    i++
    var set1 = @{1,2,3}
    set1[i]++
    set1[i]--
    print(set1[i].toString())
    if (set1[i] == 2) {
        return 0
    }
    return 1
}