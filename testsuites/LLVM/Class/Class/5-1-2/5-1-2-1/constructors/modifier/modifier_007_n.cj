// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f


abstract class Data {
    var a : Int32
    abstract init() { // EXPECTED: regex 'abstract' modifier is illegal for constructor in class body
        a = 2
    }
    func f1()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
