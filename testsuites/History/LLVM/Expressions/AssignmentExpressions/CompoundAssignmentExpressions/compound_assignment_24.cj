// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var a = 2
    let b = #{1,2,3}
    for (i in b) {
        a -=1
        a +=2
    }
    if (a==5) {
        return 0
    }
    return 1
}
