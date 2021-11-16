// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = false
    let x = "bom"
    let n = (3, 5)
    match (i) { case true | $$ x => case false | '$'n => } // EXPECTED: regex expected constant literal here
    return 0
}
