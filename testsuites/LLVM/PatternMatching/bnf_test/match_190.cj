// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = true
    match (i) { case false ""n"' => case true ""jack"" => } // EXPECTED: regex string literal is missing \'\"\' in the end
    return 0
}
