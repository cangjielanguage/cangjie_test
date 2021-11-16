// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external enum TimeUnit1 {
    Year | Month | Day | Hour
}


external func foo (data:TimeUnit1){
    let Boo: Bool = match (data) {
        case $Year => true
        case $Month => false
        case $Day => false
        case $Hour => false
    }
    return Boo
}

func main(): Int64 {
    if(foo(TimeUnit1.Year)){
        return 0
    }else{
    return 1
    }
}
