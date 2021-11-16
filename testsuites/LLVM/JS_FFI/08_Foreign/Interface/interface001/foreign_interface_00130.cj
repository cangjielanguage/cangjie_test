// EXEC-PIPE-1:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign interface A{
    static var c : Int64
}

foreign{
    interface B{
        static var c : Int64
    }
}

var a = A.c  // EXPECTED: regex function 'c' cannot be accessed by interface name 'A'
var b = B.c  // EXPECTED: regex function 'c' cannot be accessed by interface name 'B'