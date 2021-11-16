// EXEC: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f


from std import util.*

func main():Int64 {
    var args: Array<String> = Array<String>(["-a", "1", "-b", "2", "-cfoo", "--arg1", "bar", "--arg2", "a1", "a2"])
    var longFormat: Array<String> = Array<String>(["--arg1=", "--arg2"])
    var shortFormat = "a:b:c:"
    ArgOpt(args, longFormat, shortFormat)  // EXPECTED: regex no matching constructor for call 'ArgOpt'
    ArgOpt(longFormat, args, shortFormat)  // EXPECTED: regex no matching constructor for call 'ArgOpt'
    ArgOpt(longFormat, shortFormat, args)
    return 0
}