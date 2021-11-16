// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args

from std import sync.*

func main(): Int64 {
    let test = AtomicUInt32(0)
    test.store(0)

    let thread: Future<Unit> = spawn {
        test.store(4294967295)
    }

    while (test.load() != 4294967295) {
        sleep(0)
    }

    test.store(2147483648)

    if (test.load() == 4294967295) {
        return 1
    }
    return 0
}
