// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var r13 = "中国".toUtf32Array() // [0, 0, 78, 45, 0, 0, 86, -3] 00 00 4E 2D 00 00 56 FD
    if ( !convertUtf32(r13,"|20013|22269")){
        return 2
    }
    return 0
}

func convertUtf32(arr: Array<UInt32>,res:String){
    var exp:String = ""
    for ( i in arr ){
        exp = exp + "|" + "${i}"
    }
    if ( exp != res ){
        return false
    }
    return true
}