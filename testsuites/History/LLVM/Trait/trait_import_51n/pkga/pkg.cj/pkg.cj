// DEPENDENCE: pkga.cj
// EXEC: %compiler %cmp_opt  %n.cj pkga.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

package pkga

trait Num2 {
    func plus(a: This, b: This): This
}

append Int32 with Num2 {
    func plus(a: Int32, b: Int32) {a + b}
}

func run(): Int64 {
    var res: Int32 = plus(1,2) // EXPECTED: regex ambiguous match for function call
    if ( res ==  3) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
