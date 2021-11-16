// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex do not weaken access privilege 'protected' for function 'f2' in 'Base'

internal class Base {
    protected open func f2() { return 1 }
}

external open class child1 <: Base {
    public func f1() { return 2 }
}

external open class child2 <: child1 {
    private override func f2() { return 3 }
}

func main(): Int64 {

    return 0
}