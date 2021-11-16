// EXEC: %compiler %cmp_opt -chir-cc -chir-llvm %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan utc.toString() = UTC
// ASSERT: scan newYork.toString() = America/New_York
// ASSERT: scan custom.toString() = Custom
// ASSERT: scan in utc zone, 2021-08-04T16:00:00Z
// ASSERT: scan in local zone, 2021-08-05T00:00:00+08:00
// ASSERT: scan in newYork zone, 2021-08-04T12:00:00-04:00
// ASSERT: scan in custom zone, 2021-08-04T17:00:00+01:00
// ASSERT: scan-not Exception

from time import time.*

func main(): Int64 {
    var utc = Location.load("UTC").getOrThrow()
    var local = Location.load("Local").getOrThrow()
    var newYork = Location.load("America/New_York").getOrThrow()
    var custom = Location("Custom", Int32(3600))

    print("utc.toString() = ${utc}\n")
    print("local.toString() = ${local}\n")
    print("newYork.toString() = ${newYork}\n")
    print("custom.toString() = ${custom}\n")

    var t = Time(2021, Month.August, 5)

    print("in utc zone, ${t.inZone(utc)}\n")
    print("in local zone, ${t.inZone(local)}\n")
    print("in newYork zone, ${t.inZone(newYork)}\n")
    print("in custom zone, ${t.inZone(custom)}\n")

    return 0
}
