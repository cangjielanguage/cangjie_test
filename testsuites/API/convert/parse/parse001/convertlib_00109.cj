// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import convert.*

func getResultParse<T>(f: (String)-> Option<T>, arg: String, default: T): T{
    var parse = f(arg)
    var res = matchResult<T>(parse, default)
    return res
}

func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(x) => x
        case $None => default
    }
    return result
}

func main():Int64 {
    var str1 = """
123"""
    var str2 = #"123"#
    var a = parseInt8(str1)
    var b = parseInt8(str2)
    var c = parseInt8("""
123""")
    var d = parseInt8(#"123"#)

    var res1 = matchResult<Int8>(a, 0)
    var res2 = matchResult<Int8>(b, 0)
    var res3 = matchResult<Int8>(c, 0)
    var res4 = matchResult<Int8>(d, 0)
    if (res1 == 123 && res2 == 123 && res3 == 123 && res4 == 123) {
        return 0
    }
    return 1
}