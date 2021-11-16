// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A<T>{}

trait update{
func foo(a:This):Int32
}

append A<Int32> with update{} // EXPECTED: regex function 'foo' need to be implemented in append 'Interface-A<Int32>'
