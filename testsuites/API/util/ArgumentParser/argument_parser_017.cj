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
    var args: Array<String> = Array<String>(["-a1", "-b2", "-cfoo", "--arg1", "bar", "--arg2", "a1", "a2"])
    var longFormat: Array<String> = Array<String>(["long1=", "long2"])
    var shortFormat = "efghijk"
    var parser = ArgOpt(args, shortFormat, longFormat)
    var opt1 = parser.getArg("--arg1")
    var opt2 = parser.getArg("--arg2")
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
    if (res1 == "" && res2 == "" && res7 == "-a,-b,-c,--arg1,--arg2," && res8 == "bara1a2") {
        return 0
    }

    return 1
}