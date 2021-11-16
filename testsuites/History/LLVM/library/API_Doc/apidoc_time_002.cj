// EXEC: %compiler %cmp_opt -chir-cc -chir-llvm %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan local zone:
// ASSERT: scan utc zone:
// ASSERT: scan-not Exception

from time import time.*

func main(): Int64 {
    var t = Time(2021, Month.August, 5)

    print("local zone: ${t}\n")
    print("utc zone: ${t.utc()}\n")

    return 0
}
