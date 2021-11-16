// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = true
    match (i) { case false | 0b22 => case true | 0bb11 => } // EXPECTED: regex invalid digit '2' in binary number
    return 0
}
