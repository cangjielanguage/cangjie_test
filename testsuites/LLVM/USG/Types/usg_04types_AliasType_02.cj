// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

class A {
    class B { } //error: class type must be toplevel
}
type ClassB = B //error: undeclared type name 'B'