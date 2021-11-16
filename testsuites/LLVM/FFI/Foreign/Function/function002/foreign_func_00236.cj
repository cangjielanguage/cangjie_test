// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f
type mytype = Int32

foreign func foo(a:mytype):mytype

foreign {
    func bar(a:mytype):mytype
}
