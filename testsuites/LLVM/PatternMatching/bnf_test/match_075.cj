// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    let i = 50
    match (i) { case 0b12 => case 0O29 => } // EXPECTED: regex invalid digit '2' in binary number
    return 0
}
