// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface I0 {
interface I0 <: I2{} // EXPECTED: regex-auto interface type must be toplevel
}


interface I2 <: I0.I0{
}

