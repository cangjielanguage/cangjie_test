// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    let scorelist = [50, 60, 70, 80, 90]
    match (scorelist) { case list{50, 60, ..., ..., 90} => } // EXPECTED: regex expected '=>' after pattern in case body
    return 0
}
