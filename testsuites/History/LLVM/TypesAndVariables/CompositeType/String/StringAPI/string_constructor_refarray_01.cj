// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var arr1 = RefArray<Char>(['a','b','c'])
    var arr2 = RefArray<Char>(3, { i => chr(UInt32(i)+97) })
    var str1 = String(arr1)
    var str2 = String(arr2)
    if ( str1 != "abc" ){
        return 1
    }
    if ( str2 != "abc" ){
        return 2
    }
    return 0
}
