// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var res = 0
    try {
        var r1 = "abc".substring(3,1)
    } catch ( e1:IndexOutOfBoundsException ){
        res++
    }
    try {
        var r1 = "abc".substring(0,4)
    } catch ( e3:IndexOutOfBoundsException ){
        res++
    }
    try {
        var r1 = "abc".substring(-1,2)
    } catch ( e3:IndexOutOfBoundsException ){
        res++
    }
    try {
        var r1 = "中国".substring(0,-1)
    } catch ( e4:IllegalArgumentException ){
        res++
    }
    if ( res != 4 ){
        return 1
    }
    return 0
}
