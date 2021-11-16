// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var r13 = "0Aa !~\n".toUtf8Array()
    if ( !convertUtf8(r13,"|48|65|97|32|33|126|10")){
        return 1
    }
    return 0
}

func convertUtf8(arr: Array<UInt8>,res:String){
    var exp:String = ""
    for ( i in arr ){
        exp = exp + "|" + "${i}"
    }
    if ( exp != res ){
        return false
    }
    return true
}