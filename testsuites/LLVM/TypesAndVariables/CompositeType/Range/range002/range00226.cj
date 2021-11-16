// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
type myType = Range<Int64>

func main(): Int64 {
    var output : myType = 0..10:1
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
