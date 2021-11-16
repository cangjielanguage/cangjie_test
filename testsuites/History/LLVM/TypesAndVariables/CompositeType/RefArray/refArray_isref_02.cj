// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() {
    let al :ArrayList<Int64> = ArrayList<Int64>([1,2,3,4,5].toArray())
    var arr : RefArray<Int64> = RefArray<Int64>(al)
    var b = arr
    b[0] = 100
    return arr[0] - 100
}