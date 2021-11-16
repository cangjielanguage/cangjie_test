// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign class Point {
    operator func -(): Int32{return 3} // EXPECTED: regex foreign function can not have body
}
