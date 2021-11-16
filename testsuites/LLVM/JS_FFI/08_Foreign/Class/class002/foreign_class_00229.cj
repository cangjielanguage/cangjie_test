// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign class A{
    static func a(input:Int16):Int32 // EXPECTED: regex function 'a' has overload conflicts
    static func a(input:Int16):Bool // EXPECTED: regex function 'a' has overload conflicts
}

foreign{
    class B{
        static func a(input:Int16):Int32 // EXPECTED: regex function 'a' has overload conflicts
        static func a(input:Int16):Char// EXPECTED: regex function 'a' has overload conflicts
    }
}
