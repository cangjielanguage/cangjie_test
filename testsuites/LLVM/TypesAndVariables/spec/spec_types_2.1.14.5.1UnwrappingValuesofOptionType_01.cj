// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum Option<T> { Some(T) | None }


func main(){
    let opInt32_1 = Option<Int32>.Some(100)
    let opInt32_2 = Option<Int32>.None
    let opEnum = Option<TimeUnit1>.Some(TimeUnit1.Year)
    let number1: Int32 = match (opInt32_1) {
        case Some(num) => num  // matched
        case $None => 0
    }
    let number2: Int32 = match (opInt32_2) {
        case Some(num) => num
        case $None => 0  // matched
    }
    let enumValue: String = match (opEnum) {
        case Some(tu) => match (tu) {
            case $Year => "Year"  // matched
            case $Month => "Month"
            case $Day => "Day"
            case $Hour => "Hour"
             }
        case $None => "None"
    }
     
    return 0
}

enum TimeUnit1 {
   Year | Month | Day | Hour
}



