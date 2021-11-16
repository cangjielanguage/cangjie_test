// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign class A{
init() // EXPECTED: regex function 'init' has overload conflicts
init() // EXPECTED: regex function 'init' has overload conflicts
}

foreign {
class B{
init() // EXPECTED: regex function 'init' has overload conflicts
init() // EXPECTED: regex function 'init' has overload conflicts
}
}
