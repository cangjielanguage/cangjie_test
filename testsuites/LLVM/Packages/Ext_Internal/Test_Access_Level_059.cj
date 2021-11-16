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
    protected var value = "subClass1"
    func getValue():String {return value}
}

func main(): Int64 {

    var obj:subclass1 = subclass1()
    if (obj.getValue() != "subClass1") {
        return 1
    }

    return 0
}