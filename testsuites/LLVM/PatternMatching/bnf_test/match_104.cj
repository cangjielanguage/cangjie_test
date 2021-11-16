// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = ("bom", 20)
    match (i) { case ("case", 50) 'hello world" => } // EXPECTED: regex character literal is missing \'\'\' in the end
    return 0
}
