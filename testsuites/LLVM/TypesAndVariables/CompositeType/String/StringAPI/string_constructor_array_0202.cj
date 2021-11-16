// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var arr1 = Array<Char>(['a','b','c'])
    var arr2 = Array<Char>(3, { i => chr(UInt32(i)+97) })
    var res = 0
    try {
        var str1 = String(arr1,start:-1,length:1)
    } catch ( e:IllegalArgumentException ){
        res++
    }
    try {
        var str1 = String(arr1,start:4,length:0)
    } catch ( e:IllegalArgumentException ){
        res++
    }
    if ( res != 2 ){
        return 1
    }
    return 0
}
