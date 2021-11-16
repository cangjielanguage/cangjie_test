// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex abstract function 'get' should not have modifiers
// ASSERT: regex 'abstract' modifier is illegal for function declaration


abstract class Base {
     private abstract func get() : Int32
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
