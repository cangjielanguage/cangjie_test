// EXEC: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import convert.*

func main():Int64 {
    fromHexString('a')  // EXPECTED: regex argument is mismatched with parameter type 'Record-String'
    return 0
}