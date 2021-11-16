// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f

abstract class Base {
    static  func get() : Int32 // EXPECTED: regex abstract function 'get' should not have modifiers
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
