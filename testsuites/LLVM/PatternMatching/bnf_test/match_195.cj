// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = 0b11
    match (i) { case 0b22 => } // EXPECTED: regex invalid digit \'2\' in binary number
    return 0
}
