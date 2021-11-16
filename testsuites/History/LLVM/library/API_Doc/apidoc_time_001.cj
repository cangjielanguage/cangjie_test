// EXEC: %compiler %cmp_opt -chir-cc -chir-llvm %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Now is 
// ASSERT: scan th day
// ASSERT: scan-not Exception

from time import time.*

func main(): Int64 {
    var now = Time.now()

    var yr = now.year()
    var mon = now.month()
    var day = now.day()
    var hr = now.hour()
    var min = now.minute()
    var sec = now.second()
    var ns = now.nanosecond()
    var (name, offset) = now.zone()
    var wday = now.weekday()
    var yday = now.yearDay()
    var (isoYr, isoWk) = now.isoWeek()

    print("Now is ${yr}, ${mon}, ${day}, ${hr}, ${min}, ${sec}, ${ns}, ${name}, ${offset}\n")
    print("now.toString() = ${now}\n")
    print("${wday}, ${yday}th day, ${isoWk}th week of ${isoYr}\n")

    return 0
}
