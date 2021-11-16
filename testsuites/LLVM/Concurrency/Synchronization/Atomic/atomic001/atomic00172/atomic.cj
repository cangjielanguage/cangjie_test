// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args

from std import sync.*

func main(): Int64 {
    let test = AtomicUInt64(0)
    test.store(0)

    let thread: Future<Unit> = spawn {
        test.store(18446744073709551615)
    }

    while (test.load() != 18446744073709551615) {
        sleep(0)
    }

    test.store(9223372036854775808)

    if (test.load() == 18446744073709551615) {
        return 1
    }
    return 0
}
