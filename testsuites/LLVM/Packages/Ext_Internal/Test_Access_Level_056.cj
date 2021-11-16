// EXEC:%compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dump

internal open class Base {
    protected var value = "baseClass"
}

external open class subclass <: Base {
    protected var value = "subClass"  // EXPECTED: regex the variable 'value' must not shadow a member variable of the supertype
    func getValue():String {return value}
}

func main(): Int64 {

    var obj: subclass = subclass()

    if (obj.getValue() != "subClass") {
        return 1
    }

    return 0
}
