// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var r12 = "中国".toUtf16Array() // [-2, -1, 78, 45, 86, -3] FE FF 4E 2D 56 FD
    if ( !convertUtf16(r12,"|20013|22269")){
        return 2
    }
    return 0
}

func convertUtf16(arr: Array<UInt16>,res:String){
    var exp:String = ""
    for ( i in arr ){
        exp = exp + "|" + "${i}"
    }
    if ( exp != res ){
        return false
    }
    return true
}