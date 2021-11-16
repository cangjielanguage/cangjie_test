// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external enum TimeUnit1 {
    Year | Month | Day | Hour
}

external class A{
    let value = TimeUnit1.Year
}

external func foo (data:A):TimeUnit1{
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
