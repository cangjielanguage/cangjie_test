// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package packageTest

internal class Aoo{var value = 8}

external class A{   
    public func foo(x:Aoo):Aoo{  // EXPECTED: regex external declaration uses internal types
        return x
    }
}

func main(): Int64 {
    if(A().foo(Aoo()).value==8){
        return 0
    }else{
        return 1
    }
}
