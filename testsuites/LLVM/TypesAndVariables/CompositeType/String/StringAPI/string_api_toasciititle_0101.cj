// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var r1 = "çabc".toAsciiTitle()
    var r2 = "çabcçabc".toAsciiTitle()
    var r3 = "ÇçĞğÖö".toAsciiTitle()
    if ( r1 != "çAbc" ){
        return 1
    }
    if ( r2 != "çAbcçAbc"  ){
        return 2
    }
    if ( r3 != "ÇçĞğÖö" ){
        return 3
    }
    return 0
}