// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit{ Year | Month }

type Time = TimeUnit

func main(): Int64 {
    var timeY: Time = TimeUnit.Year
    var timeM: Time = TimeUnit.Month
    var res1: Int32 = match (timeY) {
        case $Year => 2020
        case $Month => 11
    }
    var res2: Int32 = match (timeM) {
        case $Year => 2020
        case $Month => 11
    }
    if (res1 == 2020 && res2 == 11) {
        return 0
    }
    return 1
}