// EXEC: %compiler %cmp_opt -chir-cc -chir-llvm %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan sat.toString() = Saturday
// ASSERT: scan sun.toString() = Sunday
// ASSERT: scan sat.value() = 6
// ASSERT: scan sun.value() = 0
// ASSERT: scan sat == sun ? false
// ASSERT: scan-not Exception

from time import time.*

func main(): Int64 {
    var sat = Weekday.Saturday
    var sun = Weekday.of(0).getOrThrow()

    print("sat.toString() = ${sat}\n")
    print("sun.toString() = ${sun}\n")

    print("sat.value() = ${sat.value()}\n")
    print("sun.value() = ${sun.value()}\n")

    print("sat == sun ? ${sat == sun}\n")

    return 0
}
