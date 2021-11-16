// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

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
ord }

    return 0
}

// AT: regex-not core dumped
