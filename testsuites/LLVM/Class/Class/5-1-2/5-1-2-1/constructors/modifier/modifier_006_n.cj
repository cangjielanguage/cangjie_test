// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f


class Data {
    var a : Int32
    internal init() { // EXPECTED: regex 'internal' modifier is illegal for constructor in class body
        a = 2
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
