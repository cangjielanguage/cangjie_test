// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external enum TimeUnit1 {
    Year | Month | Day | Hour
}


external record  A{
    var a:TimeUnit1=TimeUnit1.Month
}

func main(): Int64 {

    return 0
}
