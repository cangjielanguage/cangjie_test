// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var input = 0..10:1
    let lambda = { a:Range<Int64> => a}
    var output = lambda(input)
    var a = Array<Int64>([0,1,2,3,4,5,6,7,8,9])
    var res = 0
    for (i in a[output]) {
        res = res + i
    }
    if (res == 45) {
        return 0
    }
    return 1
}
