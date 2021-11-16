// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var str1 = "abc"
    var str2 = ""
    var b1 = str1.toBytes()
    var b2 = str2.toBytes()
    var res = ""
    for (i in b1) {
        res = res + "${i}"
    }
    if ( res != "979899"){
        return 1
    }
    return 0
}
