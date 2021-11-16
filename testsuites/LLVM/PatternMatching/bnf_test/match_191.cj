// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    let list1 = {10, 20, 30}
    var i = 20
    match (i) { case iin $list1 => } // EXPECTED: regex expected '=>' after pattern in case body
    return 0
}
