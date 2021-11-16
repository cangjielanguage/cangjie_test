// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = true
    match (i) { case true | 0b22 | 0o19 => } // EXPECTED: regex invalid digit '9' in octal number
    return 0
}
