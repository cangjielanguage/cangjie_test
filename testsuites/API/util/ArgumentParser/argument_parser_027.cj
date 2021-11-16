// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args 2>&1 | compare %f
// ASSERT: regex IllegalArgumentException



from std import util.*
func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(y) => y
        case $None => default
    }
    return result
}

func main():Int64 {
    var args: Array<String> = Array<String>(["30%", "b+12", "arg1", "c", "a-b", "b+c*/d", "1"])
    var longFormat: Array<String> = Array<String>(["arg1="])
    var shortFormat = "a:b:c:d:"
    var parser = ArgOpt(args, shortFormat, longFormat)
    var opt1 = parser.getArg("arg1")
    var opt2 = parser.getArg("a")
    var opt3 = parser.getArg("b")
    var opt4 = parser.getArg("c")
    var opt5 = parser.getArg("d")

    var res1 = matchResult<String>(opt1, "")
    var res2 = matchResult<String>(opt2, "")
    var res3 = matchResult<String>(opt3, "")
    var res4 = matchResult<String>(opt4, "")
    var res5 = matchResult<String>(opt5, "")

    var res7 = ""
    var argsMap = parser.getArgumentsMap()
    var unArgs = parser.getUnparseArgs()
    for (item in argsMap) {
        res7 = res7 + item[0].toString() + "," + item[1].toString()
    }
    var res8 = ""
    for (item in unArgs) {
        res8 = res8 + item.toString()
    }
    if (res1 == "bar" && res2 == "" && res7 == "" && res8 == "30%b+12arg1ca-bb+c*/d1") {
        return 0
    }

    return 1
}