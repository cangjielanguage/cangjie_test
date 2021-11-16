// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( case01() != 0 ){
        return 1
    }
    return 0
}

func case01(){
    var a = "abc"
    if ( "${a}${a}" != "abcabc") {
        return 1
    }
    if ( "${(a)}" != "abc") {
        return 1
    }
    var b = 1
    if ( "${Int32(b)}" != "1") {
        return 1
    }
    if ( "${(b)}" != "1") {
        return 1
    }
    if ( "${a}${b}" != "abc1") {
        return 1
    }
    if ( """
${a}${b}""" != "abc1") {
        return 1
    }
    if ( """
${a}
${b}""" != """
abc
1""") {
        return 1
    }
    return 0
}
