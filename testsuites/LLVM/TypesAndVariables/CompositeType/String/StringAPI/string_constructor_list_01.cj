// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var arr1 = List<Char>(['a','b','c'])
    var str1 = String(arr1)
    if ( str1 != "abc" ){
        return 1
    }
    return 0
}
