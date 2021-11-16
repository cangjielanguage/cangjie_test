// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main() {
    enum i { a
        | b
            | c
            | d
    }
    let i = "a"
    match (i) { case $.a => } // EXPECTED: regex invalid pattern in a match case
    return 0
}
