// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    let i = "a"
    match (i) { case true | "a\" | 'b" => case false | """v" | '''n" => } // EXPECTED: regex multi-line string literal must begin on a new line
    return 0
}
