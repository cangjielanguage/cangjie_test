// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    let I: List<Int32> = [50, 60, 70]
    match (I) { case List{50, ..., 70, ...} => case List{...,70] => } // EXPECTED: regex expected newline or ';' between expression or declaration
    return 0
}
