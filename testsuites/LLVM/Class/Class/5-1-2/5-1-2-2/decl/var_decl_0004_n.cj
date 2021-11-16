// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f
// ASSERT: regex the uninitialized member variable 'a' is not initialized in the constructor of class or record


class Data {
    var a : Int32
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
