// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = true
    match (i) { case true | 2ee-3 => } // EXPECTED: regex exponent part donot has digits
    return 0
}
