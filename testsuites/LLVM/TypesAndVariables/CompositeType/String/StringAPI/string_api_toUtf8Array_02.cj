// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var r11 = "中国".toUtf8Array() // [-28, -72, -83, -27, -101, -67] E4 B8 AD E5 9B BD
    if ( !convertUtf8(r11,"|228|184|173|229|155|189")){
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