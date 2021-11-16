// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var r11 = "0Aa !~\n".toUtf32Array() // 0:48 A:32 a:97 !:33 ~:126 \n:10
    if ( !convertUtf32(r11,"|48|65|97|32|33|126|10")){
        return 1
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