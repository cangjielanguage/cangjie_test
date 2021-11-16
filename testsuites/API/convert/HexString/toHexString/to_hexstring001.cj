// EXEC: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import convert.*

func main():Int64 {
    let b = Array<UInt8>([1, 2, 3])
    var a = Array<UInt8>([1, 2, 3])

    var res = toHexString(a, b)  // EXPECTED: regex extra argument given for call with parameter list
    return 0
}