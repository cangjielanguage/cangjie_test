// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign interface A{ // EXPECTED: regex unexpected interface declaration
}

foreign{ // EXPECTED: regex unexpected interface declaration
interface B{
}
}
