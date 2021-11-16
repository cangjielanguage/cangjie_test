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
    var args: Array<String> = Array<String>(["--long-arg", "-a1", "--arg2=bar", "-b2"])
    var args1: Array<String> = Array<String>(["--long-arg=foo", "-a1", "--arg2=bar", "-b2"])
    var longFormat: Array<String> = Array<String>(["long-arg=", "arg2="])
    var shortFormat = "a:b:c:"
    var parser1 = ArgOpt(args, shortFormat, longFormat)
    var parser2 = ArgOpt(args1, shortFormat, longFormat)
    var opt1 = parser1.getArg("--arg2")
    var opt2 = parser1.getArg("--long-arg")
    var opt3 = parser1.getArg("a")
    var opt4 = parser1.getArg("b")

    var res1 = matchResult<String>(opt1, "")
    var res2 = matchResult<String>(opt2, "")
    var res3 = matchResult<String>(opt3, "")
    var res4 = matchResult<String>(opt4, "")

    var res7 = ""
    var argsMap = parser1.getArgumentsMap()
    var unArgs = parser1.getUnparseArgs()
    for (item in argsMap) {
        res7 = res7 + item[0].toString() + "," + item[1].toString()
    }
    var res8 = ""
    for (item in unArgs) {
        res8 = res8 + item.toString()
    }
    if (res1 == "bar" && res2 == "" && res3 == "1" && res4 == "2" && res7 == "-a,1-b,2--long-arg,--arg2,bar" && res8 == "") {
        return 0
    }

    return 1
}