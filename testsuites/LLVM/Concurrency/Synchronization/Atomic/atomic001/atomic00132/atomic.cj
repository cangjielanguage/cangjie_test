// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args

from std import sync.*

func main(): Int64 {
    let test = AtomicInt64(1)
    test.store(0)

    let thread: Future<Unit> = spawn {
        test.store(-9223372036854775808)
    }

    while (test.load() != -9223372036854775808) {
        sleep(0)
    }

    test.store(9223372036854775807)

    if (test.load() == 9223372036854775807) {
        return 0
    }
    return 1
}
