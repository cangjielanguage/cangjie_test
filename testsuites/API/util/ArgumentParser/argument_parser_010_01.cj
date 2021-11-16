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
    var args: Array<String> = Array<String>(["-"])
    var longFormat: Array<String> = Array<String>([])
    var shortFormat = "a:"
    var parser = ArgOpt(args, shortFormat, longFormat)
    var opt1 = parser.getArg("-a")
    var res1 = matchResult<String>(opt1, "")

    if (res1 == "") {
        return 0
    }
    return 1
}