// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan -128

from std import sync.*

func main(): Int64 {
    let test = AtomicInt64(-1)

    let thread1: Future<Int64> = spawn {
        test.fetchXor(1)
    }

    let thread2: Future<Int64> = spawn {
        test.fetchXor(2)
    }

    let thread3: Future<Int64> = spawn {
        test.fetchXor(4)
    }

    let thread4: Future<Int64> = spawn {
        test.fetchXor(8)
    }

    let thread5: Future<Int64> = spawn {
        test.fetchXor(16)
    }

    let thread6: Future<Int64> = spawn {
        test.fetchXor(32)
    }

    let thread7: Future<Int64> = spawn {
        test.fetchXor(64)
    }

    while (test.load() != -128) {
        sleep(0)
    }
    print(test.load().toString())
    return 0
}
