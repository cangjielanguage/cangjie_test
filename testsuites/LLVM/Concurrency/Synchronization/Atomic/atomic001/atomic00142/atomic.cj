// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args

from std import sync.*

func main(): Int64 {
    let test = AtomicUInt8(0)
    test.store(0)

    let thread: Future<Unit> = spawn {
        test.store(255)
    }

    while (test.load() != 255) {
        sleep(0)
    }

    test.store(128)

    if (test.load() == 255) {
        return 1
    }
    return 0
}
