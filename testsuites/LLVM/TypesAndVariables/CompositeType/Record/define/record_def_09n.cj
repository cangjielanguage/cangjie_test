// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto illegal record member in record block
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Test {
    class Foo {}
}
