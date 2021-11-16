// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var r12 = "0Aa !~\n".utf16View
    if ( !convertUtf16(r12,"|48|65|97|32|33|126|10")){
        return 1
    }
    return 0
}

func convertUtf16(arr: Utf16View,res:String){
    var exp:String = ""
    for ( i in arr ){
        exp = exp + "|" + "${i}"
    }
    print("${exp}\n")
    if ( exp != res ){
        return false
    }
    return true
}