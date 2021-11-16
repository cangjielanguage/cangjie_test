// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex illegal object in toplevel
function main(): Int64 {
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
