// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output  2>&1| compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func f() {
    var x = 1
    let y = 2

    func g() {
        print("${x}") // OK, captured a mutable variable.
    }
    func g2() {
        g() // OK, g2 also captured a mutable variable
    }
    let c = g2 // EXPECTED:regex error.*?g2 cannot be assigned to a variable
    let e = { print("${x}") } // EXPECTED:regex error.*? lambda captured a mutable variable directly, lambda cannot be used as a expression
    let i = { x*x }() // OK, lambda captured a mutable variable, can be invoked.
    g // EXPECTED:regex error.*?g captured a mutable variable directly, g cannot be used as a expression


func main() {
    return 0
}
