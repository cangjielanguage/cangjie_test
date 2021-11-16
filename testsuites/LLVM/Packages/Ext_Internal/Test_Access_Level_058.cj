// EXEC:%compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dump

internal open class Base {
    var value = "baseClass"
}

external open class subclass <: Base {
    public var temp = "temp"
}

external open class subclass1 <: subclass {
    public var value = "subClass1"  // EXPECTED: regex the variable 'value' must not shadow a member variable of the supertype
}

func main(): Int64 {

    var obj:subclass1 = subclass1()
    if (obj.value != "subClass1") {
        return 1
    }

    return 0
}
