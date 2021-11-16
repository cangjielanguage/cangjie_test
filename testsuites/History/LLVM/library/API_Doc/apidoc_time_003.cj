// EXEC: %compiler %cmp_opt -chir-cc -chir-llvm %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan t1.toString(customPtn) = 2021/08/05 21:08:04 +08:00
// ASSERT: scan t2.toString() = 2021-08-05T21:08:04+10:00
// ASSERT: scan-not Exception

from time import time.*

func main(): Int64 {
    var customPtn = "yyyy/MM/dd HH:mm:ss ZZZZ"
    var t1 = Time.parse("2021-08-05T21:08:04+08:00").getOrThrow()
    var t2 = Time.parse("2021/08/05 21:08:04 +10:00", customPtn).getOrThrow()

    print("t1.toString(customPtn) = ${t1.toString(customPtn)}\n")
    print("t2.toString() = ${t2}\n")

    return 0
}
