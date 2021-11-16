// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = ("jack", 50)
    let n = 20
    match (i) { case ("jack", 50) if (if ( ${n} = 20)) => } // EXPECTED: regex invalid condition expr after 'if'
    return 0
}
