// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A<T>{}

foreign let a : A<Int32> // EXPECTED: regex xxx
foreign var b : A<Int32> = A<Int32>() // EXPECTED: regex xxx

foreign{
    var c : A<Int32> // EXPECTED: regex xxx
    let d : A<Int32> = A<Int32>() // EXPECTED: regex xxx
}
