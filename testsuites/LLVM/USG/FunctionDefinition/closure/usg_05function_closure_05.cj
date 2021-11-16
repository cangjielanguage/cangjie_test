// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output  2>&1| compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func f() {
    var x = 1
    let y = 2
    func g() {
        print("${x}") // OK, captured a mutable variable.
    }
    let b = g //  EXPECTED:regex error.*?g cannot be assigned to a variable
    g //  EXPECTED:regex error.*?g captured a mutable variable directly, g cannot be used as a expression
    g() // OK, g can be invoked
    g //  EXPECTED:regex error.*?g captured a mutable variable directly, g cannot be used as a expression
}


func main() {
    return 0
}
