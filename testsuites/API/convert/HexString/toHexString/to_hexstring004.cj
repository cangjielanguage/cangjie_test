// EXEC: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import convert.*

func main():Int64 {
    var res1 = toHexString(Array<UInt8>(['1', '2', '3']))  // EXPECTED: regex cannot convert a character literal to type 'UInt8'
    return 0
}