// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign class A{
    func a(input:Int16):Int32 
}

extend A{
    foreign func b(input:Int16):Bool{true} // EXPECTED: regex 'foreign' modifier is illegal for function declaration in extend body
}