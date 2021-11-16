// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

internal interface I1 {
    func f() { return 1}
}

external open class C1 implements I1 {
    private override func f() { return#� }
}

func main(): Int64 {

    return 0
}