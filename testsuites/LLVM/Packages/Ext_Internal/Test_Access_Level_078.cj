// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex do not weaken access privilege 'public' for function 'f' in 'I2'

internal interface I1 {
    func f() { return 1}
}

external interface I2 <: I1 {
    func f() {return 2}
}

external open class C1 <: I2 {
    private func f() { return 3 }
}

func main(): Int64 {

    return 0
}