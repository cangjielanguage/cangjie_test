// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign interface A{
interface a{}
public interface b{} // EXPECTED: regex 'public' modifier is illegal for interface declaration in interface body
private interface c{} // EXPECTED: regex 'private' modifier is illegal for interface declaration in interface body
protected interface d{} // EXPECTED: regex 'protected' modifier is illegal for interface declaration in interface body
}

foreign{
interface B{
interface a{}
public interface b{} // EXPECTED: regex 'public' modifier is illegal for interface declaration in interface body
private interface c{} // EXPECTED: regex 'private' modifier is illegal for interface declaration in interface body
protected interface d{} // EXPECTED: regex 'protected' modifier is illegal for interface declaration in interface body
}
}
