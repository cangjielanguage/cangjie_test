// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 127

from std import sync.*

func main(): Int64 {
    let test = AtomicInt8(0)

    let thread1: Future<Int8> = spawn {
        test.fetchOr(1)
    }

    let thread2: Future<Int8> = spawn {
        test.fetchOr(2)
    }

    let thread3: Future<Int8> = spawn {
        test.fetchOr(4)
    }

    let thread4: Future<Int8> = spawn {
        test.fetchOr(8)
    }

    let thread5: Future<Int8> = spawn {
        test.fetchOr(16)
    }

    let thread6: Future<Int8> = spawn {
        test.fetchOr(32)
    }

    let thread7: Future<Int8> = spawn {
        test.fetchOr(64)
    }

    while (test.load() != 127) {
        sleep(0)
    }
    print(test.load().toString())
    return 0
}
