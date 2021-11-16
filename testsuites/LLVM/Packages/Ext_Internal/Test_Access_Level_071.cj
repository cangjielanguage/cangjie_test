// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex do not weaken access privilege 'public' for function 'f' in 'I1'

internal interface I1 {
    func f() { return 1}
}

external open class C1 <: I1 {
    protected func f() { return 2 }
}

func main(): Int64 {
    return 0
}