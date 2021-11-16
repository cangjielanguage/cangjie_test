// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f


class Base {
    public open func get() : Int32 {
        return 1
    }
}

class Data <: Base {
    private override func get() : Int32 { // EXPECTED: regex do not weaken access privilege 'public' for function 'get' in 'Base'
        return 2
    }
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace