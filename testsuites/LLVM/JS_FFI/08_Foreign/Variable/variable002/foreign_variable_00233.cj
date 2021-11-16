// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A<T>{}
class B <: A<Int32>{}
foreign let a : A<Int32>  // EXPECTED: regex xxx
foreign var b : A<Int32> = B()  // EXPECTED: regex xxx

foreign{
    var c : A<Int32>  // EXPECTED: regex xxx
    let d : A<Int32> = B()  // EXPECTED: regex xxx
}
