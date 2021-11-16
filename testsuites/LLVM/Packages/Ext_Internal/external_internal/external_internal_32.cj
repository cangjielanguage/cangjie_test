// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
package packageTest

internal class A {
    static var a = 32
}

external func foo<T>() where T<: A{  // EXPECTED: regex external declaration uses internal types
    return T.a
} 

func main(): Int64 {
    return 0
}
