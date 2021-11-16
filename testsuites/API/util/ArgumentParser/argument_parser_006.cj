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
    var args: Array<String> = Array<String>(["--d", "bar", "--e", "foo"])
    var longFormat: Array<String> = Array<String>(["d=", "e"])
    var shortFormat = ""
    var parser = ArgOpt(args, shortFormat, longFormat)
    var opt1 = parser.getArg("--d")
    var opt2 = parser.getArg("--e")
    let res1 = matchResult<String>(opt1, "")
    let res2 = matchResult<String>(opt2, "")

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

    if (res1 == "bar" && res2 == "") {
        return 0
    }
    return 1
}