// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args

from std import sync.*

func main(): Int64 {
    let test = AtomicInt16(1)
    test.store(0)

    let thread: Future<Unit> = spawn {
        test.store(-32768)
    }

    while (test.load() != -32768) {
        sleep(0)
    }

    test.store(32767)

    if (test.load() == -32768) {
        return 1
    }
    return 0
}
