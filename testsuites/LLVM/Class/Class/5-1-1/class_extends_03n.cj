// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex undeclared type name 'Base'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data <: Base {
    var res = one
}
