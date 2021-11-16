// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import convert.*


func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(x) => x
        case $None => default
    }
    return result
}


func main():Int64 {
    var str1 = "'1"
    var a = convert.parseChar("a'")
    var b = parseChar(str1)
    var c = parseChar("'b\\'")

    var res1 = matchResult<Char>(a, '-')
    var res2 = matchResult<Char>(b, '-')
    var res3 = matchResult<Char>(c, '-')

    if (res1=='-' && res2 =='-' && res3 =='-') {
        return 0
    }
    return 1
}