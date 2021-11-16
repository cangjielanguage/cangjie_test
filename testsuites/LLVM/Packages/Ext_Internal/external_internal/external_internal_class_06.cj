// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package packageTest

internal class Aoo{var value = 6}

external class A{  
    public var a:Aoo = Aoo()  // EXPECTED: regex external declaration uses internal types
}

func main(): Int64 {
    if(A().a.value==6){
        return 0
    }else{
        return 1
    }
}

