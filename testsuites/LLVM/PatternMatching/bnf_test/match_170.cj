// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = (3, 5)
    match (i)  { case [2, 3) => case {3, 5) => } // EXPECTED: regex expected pattern here
    return 0
}
