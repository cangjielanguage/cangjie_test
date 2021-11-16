// EXEC: %compiler %cmp_opt -c  %f -o %n.%middle 2>&1 | compare %f
// ASSERT: regex function 'get' can not be abstract


external  class Data {
    func get() : Int32
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
