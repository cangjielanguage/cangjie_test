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
    var str1 = "'1\u{20}'"
    var a = convert.parseChar("'2\n'")
    var b = parseChar(str1)
    var c = parseChar("'\t3'")
    var d = parseChar("' 3'")

    var res1 = matchResult<Char>(a, '-')
    var res2 = matchResult<Char>(b, '-')
    var res3 = matchResult<Char>(c, '-')
    var res4 = matchResult<Char>(d, '-')

    if (res1=='-' && res2 =='-' && res3 =='-'&& res4 =='-') {
        return 0
    }
    return 1
}