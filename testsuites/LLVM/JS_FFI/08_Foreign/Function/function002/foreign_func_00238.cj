// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A<T>{}
type mytype = A<Int32>

foreign func foo(a:mytype):mytype // EXPECTED: regex native function can only have CType args

foreign {
    func bar(a:mytype):mytype // EXPECTED: regex native function can only have CType return

}

