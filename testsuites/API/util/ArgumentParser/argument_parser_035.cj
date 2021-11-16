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
    var args: Array<String> = Array<String>(["arg1=long", "ashort", "arg2","--long=-2", ""])
    var longFormat: Array<String> = Array<String>(["long="])
    var shortFormat = "a:b:"
    var parser = ArgOpt(args, shortFormat, longFormat)
    var opt1 = parser.getArg("--arg1")
    var opt2 = parser.getArg("--long")
    var opt3 = parser.getArg("a")
    var opt4 = parser.getArg("b")


    var res1 = matchResult<String>(opt1, "")
    var res2 = matchResult<String>(opt2, "")
    var res3 = matchResult<String>(opt3, "")
    var res4 = matchResult<String>(opt4, "")

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
    if (res1 == "" && res2 == "-2" && res3 == "" && res4 == "" && res7 == "--long,-2" && res8 == "arg1=longashortarg2") {
        return 0
    }

    return 1
}