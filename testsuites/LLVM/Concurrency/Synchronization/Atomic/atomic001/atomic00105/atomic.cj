// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan -128

from std import sync.*

func main(): Int64 {
    let test = AtomicInt8(0)
    test.fetchAdd(1)
    var i: Int64 = 0

    while (i < 127) {
        i = i + 1
        let thread: Future<Int8> = spawn {
            test.fetchAdd(1)
        }
    }

    while (test.load() != -128) {
        sleep(0)
    }
    print(test.load().toString())
    return 0
}
