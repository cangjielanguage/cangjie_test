// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = "false"
    let N = pass
    match (i) { case false => print[${N}) } // EXPECTED: regex expected ']' in the end of subscript expression
    return 0
}
