// EXEC: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f


from std import util.*

func main():Int64 {
    var args: Array<String> = Array<String>(["-a", "1", "-b", "2", "-cfoo", "--d", "bar", "--e", "a1", "a2"])
    var longFormat: Array<String> = Array<String>(["--d=", "--e"])
    var shortFormat = "a:b:c:"
    ArgOpt(args:args, shortArgFormat: shortFormat, longArgList: longFormat)    // EXPECTED: regex invalid named arguments prefix 'args:', target is not a named parameter
    return 0
}