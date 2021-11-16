// EXEC: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f


from std import util.*

func main():Int64 {
    var args: Array<String> = Array<String>(["-a", "1", "-b", "2", "-cfoo", "--d", "bar", "--e", "a1", "a2"])
    var longFormat: Array<String> = Array<String>(["--d=", "--e"])
    var shortFormat = "a:b:c:"
    ArgOpt(args, shortFormat, longFormat,1)  // EXPECTED: regex  extra argument given for call
    ArgOpt(args, shortFormat)  // EXPECTED: regex no matching constructor for call 'ArgOpt'
    ArgOpt()  // EXPECTED: regex no matching constructor for call 'ArgOpt'
    return 0
}