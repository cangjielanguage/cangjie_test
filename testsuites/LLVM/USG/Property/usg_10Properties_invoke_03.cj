// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1| compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


class A {
    private let value = 0
    prop let i: Int64 {
        get() {
            value
        }
    }
}
func main() {
    var x = A()
    x.i = 1 // EXPECTED:regex error.*?cannot assign to value which is an initialized 'let' constant
}
