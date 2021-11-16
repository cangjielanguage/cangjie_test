// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

enum A<T>{x(Int32)}

foreign let a : A<Int32> // EXPECTED: regex xxx
foreign var b : A<Int32> = A<Int32>.x(1) // EXPECTED: regex xxx

foreign{
    var c : A<Int32> // EXPECTED: regex xxx
    let d : A<Int32> = A<Int32>.x(1) // EXPECTED: regex xxx
}
