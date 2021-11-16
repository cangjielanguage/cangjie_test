// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args

from std import sync.*

func main(): Int64 {
    let test = AtomicInt32(1)
    test.store(0)

    let thread: Future<Unit> = spawn {
        test.store(-2147483648)
    }

    while (test.load() != -2147483648) {
        sleep(0)
    }

    test.store(2147483647)

    if (test.load() == -2147483648) {
        return 1
    }
    return 0
}
