// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var x = 10
    match { case __ => "bom" case '_' => print($x) } // EXPECTED: regex expected '=>' after pattern in case bod
    return 0
}
