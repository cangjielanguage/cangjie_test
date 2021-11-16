// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum Timeunit {
            Year | Month | Day | Hour
       }

func test(): Timeunit{
    Timeunit.Year
}

func main(): Int64 {

    var res = match test() {
        case $Year => 1
        case $Month => 2
        case $Day => 3
        case $Hour => 4
    }

    if res != 1 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace