// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import util.*
func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(y) => y
        case $None => default
    }
    return result
}
func main():Int64 {
    var args: Array<String> = Array<String>(["arg1=long", "-ashort", "arg2","long", "-b2"])
    var longFormat: Array<String> = Array<String>(["arg1=","arg2=","arg3"])
    var shortFormat = "a:b:c:"
    var parser = ArgOpt(args, shortFormat, longFormat)

    var opt1 = parser.getArg("--arg1")
    var opt2 = parser.getArg("--arg2")
    var opt3 = parser.getArg("--arg3")
    var opt4 = parser.getArg("a")
    var opt5 = parser.getArg("b")
    var opt6 = parser.getArg("c")


    var res1 = matchResult<String>(opt1, "")
    var res2 = matchResult<String>(opt2, "")
    var res3 = matchResult<String>(opt3, "")
    var res4 = matchResult<String>(opt4, "")
    var res5 = matchResult<String>(opt5, "")
    var res6 = matchResult<String>(opt6, "")

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

    if (res1 == "" && res2 == "" && res3 == "" && res4 == "short" && res5 == "2" && res6 == "" && res7 == "-a,short-b,2" && res8 == "arg1=longarg2long") {
        return 0
    }

    return 1
}