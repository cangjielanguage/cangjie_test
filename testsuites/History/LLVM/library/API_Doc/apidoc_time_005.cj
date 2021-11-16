// EXEC: %compiler %cmp_opt -chir-cc -chir-llvm %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan jan.toString() = January
// ASSERT: scan feb.toString() = February
// ASSERT: scan jan.value() = 1
// ASSERT: scan feb.value() = 2
// ASSERT: scan jan + 1 = February
// ASSERT: scan feb - 1 = January
// ASSERT: scan jan == feb ? false
// ASSERT: scan-not Exception

from time import time.*

func main(): Int64 {
    var jan = Month.January
    var feb = Month.of(2).getOrThrow()

    print("jan.toString() = ${jan}\n")
    print("feb.toString() = ${feb}\n")

    print("jan.value() = ${jan.value()}\n")
    print("feb.value() = ${feb.value()}\n")

    print("jan + 1 = ${jan + 1}\n")
    print("feb - 1 = ${feb - 1}\n")

    print("jan == feb ? ${jan == feb}\n")

    return 0
}
