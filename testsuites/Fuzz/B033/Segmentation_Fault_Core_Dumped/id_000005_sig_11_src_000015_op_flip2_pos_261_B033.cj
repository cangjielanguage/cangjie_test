// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

internal class Base {
    protected open func f() {#return 1 }
}

external open class parent1 <: Base {
    private override func f() { return 2 }
}

func main(): Int64 {

    return 0

}