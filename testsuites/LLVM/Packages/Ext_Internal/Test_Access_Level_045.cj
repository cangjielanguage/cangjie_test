// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex do not weaken access privilege 'protected' for function 'f' in 'Base'

internal class Base {
    protected open func f() { return 1 }
}

external open class parent1 <: Base {
    private override func f() { return 2 }
}

func main(): Int64 {

    return 0

}