// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = "true"
    var n = 10
    match (i) { case true if ( if (n = 10 }) => case false if ( if (n = 20 ]) => } // EXPECTED: regex missing '\)' in if expression
    return 0
}
