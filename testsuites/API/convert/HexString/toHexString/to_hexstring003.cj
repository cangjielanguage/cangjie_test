// EXEC: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import convert.*

func main():Int64 {
    let a = Array<Int8>([1, 2, 3])
    var res1 = toHexString(a)  // EXPECTED: regex argument is mismatched with parameter type 'Array\<UInt8\>'
    var res2 = toHexString([1,3,4])  // EXPECTED: regex no matching function declaration for function call 'toHexString'
    return 0
}