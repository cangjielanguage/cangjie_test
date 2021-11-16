// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external enum TimeUnit1 {
    Year | Month | Day | Hour
}

external record  Aoo{
    var value = TimeUnit1.Year
}

var a = Aoo().value

func main(): Int64 {
    let Num: Int64 = match (a) {
        case $Year => 0
        case $Month => 1
        case $Day => 1
        case $Hour => 1
    }
    return Num 
}
