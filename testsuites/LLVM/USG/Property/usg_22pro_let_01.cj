// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

class Foo {
    prop let a: Int64 {
        get() {
            return 0
        }
    }
}
func main() {
    var x = Foo()
    x.a = 1 //EXPECTED: regex error.*cannot assign to value which is an initialized 'let' constant
    return 0
}
