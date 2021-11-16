// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var arr1 = Array<Char>(['a','b','c'])
    var arr2 = Array<Char>(3, { i => chr(UInt32(i)+97) })
    var res = 0
    try {
        var str1 = String(arr1,start:0,length:4)
    } catch ( e:IllegalArgumentException ){
        res++
    }
    try {
        var str1 = String(arr2,start:0,length:-1)
    } catch ( e:IllegalArgumentException ){
        res++
    }
    try {
        var str1 = String(arr2,start:1,length:3)
    } catch ( e:IllegalArgumentException ){
        res++
    }
    try {
        var str1 = String(arr2,start:-1)
    } catch ( e:IllegalArgumentException ){
        res++
    }
    try {
        var str1 = String(arr2,start:3)
    } catch ( e:IllegalArgumentException ){
        res++
    }
    try {
        var str1 = String(arr1,length:4)
    } catch ( e:IllegalArgumentException ){
        res++
    }
    if ( res != 6 ){
        return res
    }
    return 0
}
