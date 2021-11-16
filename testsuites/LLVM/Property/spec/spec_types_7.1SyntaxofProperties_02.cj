// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

class A {
    prop let i: Int64 {
        get() {
            return 0
        }
    }
}
func main() {
    var x = A()
    x.i = 1  // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant
    return 0
}
