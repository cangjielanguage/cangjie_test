// EXEC: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import convert.*
func main():Int64 {
    var res1 = toHexString(Array<UInt8>([-1, 256, 454]))  // EXPECTED: regex the number '-1' exceeds the value range of type 'UInt8'
    return 0
}