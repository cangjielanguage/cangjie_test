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
    var str1 = ##"'a'"##
    var str2 = ##"'仓'"##
    var a = convert.parseChar(##"'\n'"##)
    var b = parseChar(str1)
    var c = parseChar(str2)
    var d = parseChar(##"'\u{200}'"##)
    var e = parseChar("""
'3'""")
    var f = parseChar("""
'''""")
    var g = parseChar("'@'")
    var h = parseChar("'/'")
    var i = parseChar("' '")

    var res1 = matchResult<Char>(a, '-')
    var res2 = matchResult<Char>(b, '-')
    var res3 = matchResult<Char>(c, '-')
    var res4 = matchResult<Char>(d, '-')
    var res5 = matchResult<Char>(e, '-')
    var res6 = matchResult<Char>(f, '-')
    var res7 = matchResult<Char>(g, '-')
    var res8 = matchResult<Char>(h, '-')
    var res9 = matchResult<Char>(i, '-')

    if (res1=='\n' && res2 =='a' && res3 == '仓' && res4 == '-' && res5 == '3' && res6 == '\'' && res7 == '@' && res8 =='/' && res9 == ' ' ) {
        return 0
    }
    return 1
}