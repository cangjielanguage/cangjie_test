// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

external foreign var a = 1 // EXPECTED: regex modifiers 'external' and 'foreign' are conflict in variable declaration
external foreign let b = 1 // EXPECTED: regex modifiers 'external' and 'foreign' are conflict in variable declaration

foreign {
external var c = 1 // EXPECTED: regex modifiers 'external' and 'foreign' are conflict in variable declaration
external let d = 1 // EXPECTED: regex modifiers 'external' and 'foreign' are conflict in variable declaration
}
