// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign interface A{
public class d{} // EXPECTED: regex 'public' modifier is illegal for class declaration in interface body
private class e{} // EXPECTED: regex 'private' modifier is illegal for class declaration in interface body
protected class f{} // EXPECTED: regex 'protected' modifier is illegal for class declaration in interface body
}

foreign{
interface B{
public class d{} // EXPECTED: regex 'public' modifier is illegal for class declaration in interface body
private class e{} // EXPECTED: regex 'private' modifier is illegal for class declaration in interface body
protected class f{} // EXPECTED: regex 'protected' modifier is illegal for class declaration in interface body
}
}
