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
    var args: Array<String> = Array<String>(["--=bar"])
    var longFormat: Array<String> = Array<String>(["--="])
    var shortFormat = ""
    var parser = ArgOpt(args, shortFormat, longFormat)
    var opt2 = parser.getArg("")
    var res2 = matchResult<String>(opt2, "")

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

    if (res2 == "" && res7 == "" && res8 == "--=bar") {
        return 0
    }
    return 1
}