// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign class A{
foreign let a = 1 // EXPECTED: regex 'foreign' modifier is illegal for variable declaration in class body
}

foreign interface B{
foreign let a = 1 // EXPECTED: regex 'foreign' modifier is illegal for variable declaration in interface body
}

foreign {
class C{
foreign let a = 1 // EXPECTED: regex 'foreign' modifier is illegal for variable declaration in class body
}

interface D{
foreign let a = 1 // EXPECTED: regex 'foreign' modifier is illegal for variable declaration in interface body
}
}
