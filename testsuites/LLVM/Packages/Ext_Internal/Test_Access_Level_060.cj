// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex the variable 'value' should be less restrictive than shadowed variable

internal open class Base {
    var value = "baseClass"
}

external open class subclass <: Base {
    public var temp = "temp"
}

external open class subclass1 <: subclass {
    private var value = "subClass1"
}

func main(): Int64 {

    return 0
}