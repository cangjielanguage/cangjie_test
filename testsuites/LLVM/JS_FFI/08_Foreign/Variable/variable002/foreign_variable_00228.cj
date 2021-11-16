// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign let a : Option<Int32> // EXPECTED: regex xxx
foreign var b : Option<Int32> = None<Int32> // EXPECTED: regex xxx

foreign{
    var c : Option<Int32> // EXPECTED: regex xxx
    let d : Option<Int32> = None<Int32> // EXPECTED: regex xxx
}

