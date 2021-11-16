// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


foreign class A{
init()
}

foreign{
class B{
init()
}
}
