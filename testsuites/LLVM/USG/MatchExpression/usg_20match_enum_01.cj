// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit {
    Year | Month | Day | Hour
}
func main() : Int64 {
    let x = TimeUnit.Day
    let s: String = match (x) {
        case $Year => "Year"
        case $Month | $Day => "Month"
        case $Hour => "Hour"
        case _ => "xxx"
    }
    if ( s != "Month" ) {
        return 1
    }
    0
}
