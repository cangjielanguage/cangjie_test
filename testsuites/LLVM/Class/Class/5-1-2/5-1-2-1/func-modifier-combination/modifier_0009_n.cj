// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f


class Base {
    private protected func get() : Int32 { // EXPECTED: regex  modifiers 'private' and 'protected' are conflict in function declaration

        return 1
    }
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace