// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex member func 'a' is forbidden in enum 'A' with annotation @c
@c
enum A{a(Int64)}

foreign func foo(a:A):A

foreign {
    func bar(a:A):A
}
