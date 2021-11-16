// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

class A<T> where T <: Foo { }
type B<T> = A<T>    // T here has the constraint T <: Foo
type C<T> = A<T> where T <: Coo  // error: generic constraints are not allowed here
