// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package packageTest

internal open class A{
    func foo1(){true}
    static func foo2(){0}
}

external class B <: A{  // EXPECTED: regex external declaration uses internal types
    static func foo3(){
        return false
    }
}

func main(): Int64 {
   if(B().foo1() || B.foo3()){
    return B.foo2()
   }
   return 1
}
