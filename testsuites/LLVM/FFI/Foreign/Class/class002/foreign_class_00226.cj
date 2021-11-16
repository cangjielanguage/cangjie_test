// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign class A{ // EXPECTED: regex unexpected class declaration
}


foreign{ // EXPECTED: regex unexpected class declaration
class B{
}
}
