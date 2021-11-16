// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var r1 = "ab cb".iterator()
    var r2 = "".iterator()
    var r3 = "中国中".iterator()
    var r4 =  String().iterator()
    var res = "|"
    for ( i in r1 ){
        res = res + "${i}"
    }
    res = res + "|"
    for ( i in r2 ){
        res = res + "${i}"
    }
    res = res + "|"
    for ( i in r3 ){
        res = res + "${i}"
    }
    res = res + "|"
    for ( i in r4 ){
        res = res + "${i}"
    }
    res = res + "|"
    if ( res != "|ab cb||中国中||" ){
        return 1
    }
    return 0
}