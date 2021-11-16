// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = 'dalse'
    match (i) { case true || false \|| true => } // EXPECTED: regex illegal symbol '\\'
    return 0
}
