// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


foreign class A{
init(){} // EXPECTED: regex foreign function can not have body
}

foreign {
class A{
init(){} // EXPECTED: regex foreign function can not have body
}
}

