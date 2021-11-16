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
    var args: Array<String> = Array<String>(["--arg1=bar", "--arg2=foo", "-a1","-b2"])
    var longFormat: Array<String> = Array<String>(["--arg1=","--arg2","a:b:"])
    var shortFormat = ""
    var parser = ArgOpt(args, shortFormat, longFormat)
    return 0
}