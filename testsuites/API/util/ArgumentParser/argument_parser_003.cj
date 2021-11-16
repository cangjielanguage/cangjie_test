// EXEC: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import util.*

func main():Int64 {
    var args: Array<Int8> = Array<Int8>([1,2,3])
    var longFormat: Array<String> = Array<String>(["--d=", "--e"])
    var shortFormat = "a:b:c:"
    ArgOpt(args, shortFormat, longFormat)  // EXPECTED: regex no matching constructor for call 'ArgOpt'
    ArgOpt(args, shortFormat, Array<Int8>([1, 2, 3]))  // EXPECTED: regex no matching constructor for call 'ArgOpt'
    return 0
}