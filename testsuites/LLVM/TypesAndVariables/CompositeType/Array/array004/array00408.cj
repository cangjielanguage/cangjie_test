// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface I{}

class A <: I {}

class B {}

func main(): Int64 {
    let myArray = @{A(),B()}  // the type of this 'array literal's elements' is 'Object', please explicitly annotate the type or fix the code
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace