// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var arr1 = Array<Char>(['a','b','c'])
    var arr2 = Array<Char>(3, { i => chr(UInt32(i)+97) })
    var str1 = String(arr1,start:0,length:3)
    var str2 = String(arr2)
    var str3 = String(arr1,start:1,length:1)
    if ( str1 != "abc" ){
        return 1
    }
    if ( str2 != "abc" ){
        return 2
    }
    if ( str3 != "b" ){
        return 2
    }
    return 0
}
