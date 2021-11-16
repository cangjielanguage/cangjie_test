// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = true
    match (i) { case true | 2.3ee-3 | 0.5E3 => case false | 314 | 3.14e3.14 => } // EXPECTED: regex exponent part donot has digits
    return 0
}
