// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

func main(): Int64 {
    var arr1 = Array<UInt8>([97,98,99])
    var arr2 = Array<UInt8>(3, { i => UInt8(i)+97 })
    var str1 = String(arr1,start:0,length:3) //EXPECTED: regex error.*argument is mismatched with parameter type 'Array<Char>'
    var str2 = String(arr2)
    if ( str1 != "abc" ){
        return 1
    }
    if ( str2 != "abc" ){
        return 2
    }
    return 0
}
