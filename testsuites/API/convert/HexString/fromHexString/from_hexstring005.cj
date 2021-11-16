// EXEC: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex string literal is missing '"' in the end

from std import convert.*

func main():Int64 {
    fromHexString("W\")
    return 0
}