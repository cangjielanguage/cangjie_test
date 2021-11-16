// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 18446744073709551488

from std import sync.*

func main(): Int64 {
    let test = AtomicUInt64(18446744073709551615)

    let thread1: Future<UInt64> = spawn {
        test.fetchXor(1)
    }

    let thread2: Future<UInt64> = spawn {
        test.fetchXor(2)
    }

    let thread3: Future<UInt64> = spawn {
        test.fetchXor(4)
    }

    let thread4: Future<UInt64> = spawn {
        test.fetchXor(8)
    }

    let thread5: Future<UInt64> = spawn {
        test.fetchXor(16)
    }

    let thread6: Future<UInt64> = spawn {
        test.fetchXor(32)
    }

    let thread7: Future<UInt64> = spawn {
        test.fetchXor(64)
    }

    while (test.load() != 18446744073709551488) {
        sleep(0)
    }
    print(test.load().toString())
    return 0
}
