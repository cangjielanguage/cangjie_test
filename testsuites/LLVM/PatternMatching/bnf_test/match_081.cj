// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = ("bom", 20)
    match (i) { case ("jack", 50) => prin("jack") case ("bom", 20) => print(*bom") } // EXPECTED: regex undeclared identifier 'prin'
    return 0
}
