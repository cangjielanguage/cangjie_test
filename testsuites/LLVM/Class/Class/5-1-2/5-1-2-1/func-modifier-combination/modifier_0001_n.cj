// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f

class Data {
    public private func get() : Int32 { // EXPECTED: regex modifiers 'public' and 'private' are conflict in function declaration
        return  1
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
