// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(r:Range<Int64>):Int32{
    var a = Array<Int64>([0,1,2,3,4,5,6,7,8,9])
    var res = 0
    for (i in a[r]) {
        res = res + i
    }
    if (res == 45) {
        return 0
    }
    return 1
}

func getRange1():Range<Int64>{
    return 0..10:1
}

func getRange2():Range<Int64>{
    var r = 0..10:1
    return r
}

func main(): Int64 {
    return Int64(test(getRange1()) + test(getRange2()))
}
