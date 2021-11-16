// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

type A = B
type B = C
type C = A  // error

type D = Int32*D    // error