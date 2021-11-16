// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func cmp(lhs: Int64, rhs: Int64) : Bool {
    return lhs < rhs
}
func main() {
    var arr = Array<Int64>([3, 45, 1,65, 1, 2])
    let res = [1, 1, 2, 3, 45, 65]
    arr.sortBy(cmp)
    var i = 0
    for (e in arr) {
        if (e != res[i]) {
            return 1
        }
        i++
    }
    if (i != arr.size() || i != 6) {
        return 2
    }

    return 0
}