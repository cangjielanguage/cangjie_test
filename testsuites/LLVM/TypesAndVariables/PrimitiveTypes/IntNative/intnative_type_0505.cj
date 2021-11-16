// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() {
    var b:List<IntNative> = [1,2,3]
    let al : ArrayList<IntNative> = ArrayList<IntNative>(b.toArray())
    let arr : Array<IntNative> = Array<IntNative>(al)
    var sum: IntNative = 0
    for (i in arr) {
        sum = sum + i
    }
    if ( sum != 6 ) {
        return 1
    }
    return 0
}
