// EXEC: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto undeclared type name 'Base'


class Data <: Base {
    var res = getNum()
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
