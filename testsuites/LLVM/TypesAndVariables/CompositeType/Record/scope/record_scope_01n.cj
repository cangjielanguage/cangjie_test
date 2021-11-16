// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto illegal class member in class block
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Foo {
    record Test {
       let a: Int32 = 0
       var b: Int32 = 0
    }
}

