// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

from std import collection.*
func main(): Int64 {
    var arr1: Buffer<Char> = Buffer<Char>(['a','b','c','d','e'])
    var str3 = String(arr1)
    if ( str3 != "abcde" ){
        return 1
    }
    return 0
}
