// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign class A<T>{} // EXPECTED: regex foreign declaration does not support generics

foreign {
class B<T>{} // EXPECTED: regex foreign declaration does not support generics
}
