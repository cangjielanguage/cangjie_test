// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var x = 10
    match { case _ => x=-10 case _ => print["10") } // EXPECTED: regex expected ']' in the end of subscript expression
    return 0
}
