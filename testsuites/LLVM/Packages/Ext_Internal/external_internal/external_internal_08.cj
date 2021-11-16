// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package packageTest

internal class A{
    let value=8
}

external func foo (data:A){  // EXPECTED: regex external declaration uses internal types
    return data.value       
}

func main(): Int64 {
    if(foo(A())==8){
        return 0
    }else{
        return 1
    }
}
