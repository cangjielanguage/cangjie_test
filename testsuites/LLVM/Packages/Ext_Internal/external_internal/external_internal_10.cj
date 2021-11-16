// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package packageTest

internal enum TimeUnit1 {
    Year | Month | Day | Hour
}

external record A{
    let value = TimeUnit1.Year // EXPECTED: regex external declaration uses internal types
}

func foo (data:A):TimeUnit1{   
    return A().value  
}

func main(): Int64 {
    let a = foo(A())
    let Boo: Bool = match (a) {
        case $Year => true
        case $Month => false
        case $Day => false
        case $Hour => false
    }
    if(Boo){
        return 0
    }else{
        return 1
    }
}
