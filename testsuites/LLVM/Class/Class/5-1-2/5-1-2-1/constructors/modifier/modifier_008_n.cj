// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f


class Data {
    var a : Int32
    open init() { // EXPECTED: regex 'open' modifier is illegal for constructor in class body
        a = 2
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
