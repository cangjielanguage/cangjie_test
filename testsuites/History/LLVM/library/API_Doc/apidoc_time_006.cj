// EXEC: %compiler %cmp_opt -chir-cc -chir-llvm %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan d1 = 10us
// ASSERT: scan d2 = 100us
// ASSERT: scan d3 = 10ms
// ASSERT: scan d4 = 1s
// ASSERT: scan d5 = 2m
// ASSERT: scan d6 = 3h
// ASSERT: scan in nanosecond, d1 = 10000
// ASSERT: scan in nanosecond, d2 = 100000
// ASSERT: scan in nanosecond, d3 = 10000000
// ASSERT: scan in second, d4 = 1
// ASSERT: scan in second, d4 = 120
// ASSERT: scan in second, d4 = 10800
// ASSERT: scan d1 > d2 ? false
// ASSERT: scan-not Exception

from time import time.*

func main(): Int64 {
    var d1 = Duration.nanosecond(10000)
    var d2 = Duration.microsecond(100)
    var d3 = Duration.millisecond(10)
    var d4 = Duration.second()
    var d5 = Duration.minute(2)
    var d6 = Duration.hour(3)

    print("d1 = ${d1}\n")
    print("d2 = ${d2}\n")
    print("d3 = ${d3}\n")
    print("d4 = ${d4}\n")
    print("d5 = ${d5}\n")
    print("d6 = ${d6}\n")

    print("in nanosecond, d1 = ${d1.nanoseconds()}\n")
    print("in nanosecond, d2 = ${d2.nanoseconds()}\n")
    print("in nanosecond, d3 = ${d3.nanoseconds()}\n")
    print("in second, d4 = ${d4.seconds()}\n")
    print("in second, d4 = ${d5.seconds()}\n")
    print("in second, d4 = ${d6.seconds()}\n")

    print("d1 > d2 ? ${d1 > d2}\n")

    return 0
}
