// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f
// ASSERT: regex abstract class 'Base' can not be instantiated


abstract class Base {
    public func get() : Int32 {
        return 1
    }
}

func run(): Int64 {
    var value1 : Base = Base()
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
