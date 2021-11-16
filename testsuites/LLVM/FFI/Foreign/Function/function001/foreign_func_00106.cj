// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

external foreign func foo():Unit // EXPECTED: regex modifiers 'external' and 'foreign' are conflict in function declaration

foreign {
external func bar():Unit // EXPECTED: regex modifiers 'external' and 'foreign' are conflict in function declaration
}
