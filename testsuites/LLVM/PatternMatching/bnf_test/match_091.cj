// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    enum n { a
            |b
            |c
           }
    var i = "a"
    match (i) { case $.a => case \.b => } // EXPECTED: regex illegal symbol '\\'
    return 0
}
