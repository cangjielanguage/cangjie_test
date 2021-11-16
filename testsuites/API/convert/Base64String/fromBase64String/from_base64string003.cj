// EXEC: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import convert.*

func main():Int64 {
    fromBase64String()  // EXPECTED: regex missing argument for call with parameter list
    return 0
}