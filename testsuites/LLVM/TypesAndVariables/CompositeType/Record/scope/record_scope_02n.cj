// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not 0:0: cannot capture mutable variable 'b'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func foo(): Unit {
    record Test { // EXPECTED: regex 'record' is not allowed in block, expected expression or declaration here
       let a: Int32 = 0
       var b: Int32 = 0
    }
}

