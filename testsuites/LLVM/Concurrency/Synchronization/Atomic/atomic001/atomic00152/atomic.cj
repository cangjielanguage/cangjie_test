// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args

from std import sync.*

func main(): Int64 {
    let test = AtomicUInt16(0)
    test.store(0)

    let thread: Future<Unit> = spawn {
        test.store(65535)
    }

    while (test.load() != 65535) {
        sleep(0)
    }

    test.store(32768)

    if (test.load() == 65535) {
        return 1
    }
    return 0
}
