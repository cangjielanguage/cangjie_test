// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in thread\nin main\n

from std import sync.*

func main(): Int64 {
    var test = AtomicUInt8(0)

    let thread: Future<Unit> = spawn {
        var test = AtomicUInt8(255)
        if (test.load() == 255) {
            print("in thread\n")
        }
    }

    thread.getResult()
    test = AtomicUInt8(128)

    if (test.load() == 128) {
        print("in main\n")
    }

    return 0
}
