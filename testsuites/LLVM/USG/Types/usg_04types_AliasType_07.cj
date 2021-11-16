// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

type Point2D = Float32*Float32
let x: Point2D = (1.2, 2.3)
