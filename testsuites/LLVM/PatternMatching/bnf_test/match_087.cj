// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = "true"
    match (i) { case true 'st*aer" => } // EXPECTED: regex too many characters between ''
    return 0
}
