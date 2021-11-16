// EXEC: %compiler %cmp_opt %sync-link %f -o %output
// EXEC: export CANGJIE_MAX_CONCURRENCY=1 && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan result = 1\n
// ASSERT: scan-not Exception

from std import sync.*

func main(): Int64 {
    let result = AtomicInt64(0)

    let fut1: Future<Unit> = spawn {
        print("in thread\n")
        while(true) {}
    }

    let fut2: Future<Unit> = spawn {
        sleep(1000*1000*1000)
        result.fetchAdd(1)
        while(true) {}
    }

    while (result.load() != 1) {
        sleep(0)
    }

    print("result = ${result.load()}\n")
    return 0
}
