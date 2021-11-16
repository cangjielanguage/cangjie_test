// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package packageTest

external class A<T> where T<: B{let a =T.b2} // EXPECTED: regex external declaration uses internal types

internal record B{
    static var b2 = 2 
}

func main(): Int64 {

   return A<B>().a-2
}
