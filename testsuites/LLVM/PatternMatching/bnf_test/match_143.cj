// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = false
    let N = ["jack", "bom"]
    match (i) { case true | $ N => case false | $*N => } // EXPECTED: regex  expected constant literal here
    return 0
}
