// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign interface A<T>{} // EXPECTED: regex foreign declaration does not support generics

foreign {
interface B<T>{} // EXPECTED: regex foreign declaration does not support generics
}
