// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = "Jack"
    match (i) { case true | 0b12 | 0o19 => case false | 12b | 0_15 => } // EXPECTED: regex invalid digit '2' in binary number
    return 0
}
