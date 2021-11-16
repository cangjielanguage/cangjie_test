// EXEC: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import convert.*

func main():Int64 {
    let a = Array<Int8>([1, 2, 3])
    var res1 = toBase64String(a)  // EXPECTED: regex argument is mismatched with parameter type
    return 0
}