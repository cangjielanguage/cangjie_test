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
    var args: Array<String> = Array<String>(["-11"])
    var longFormat: Array<String> = Array<String>([])
    var shortFormat = "=:@:#:%:^:"
    var parser = ArgOpt(args, shortFormat, longFormat)
    var opt1 = parser.getArg("1")
    var res1 = matchResult<String>(opt1, "")

    return 0
}