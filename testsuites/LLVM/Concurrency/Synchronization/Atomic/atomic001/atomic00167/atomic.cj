// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 0\n

from std import sync.*

func main(): Int64 {
    let test = AtomicUInt32(4294967295)

    let thread1: Future<UInt32> = spawn {
        test.fetchAnd(126)
    }

    let thread2: Future<UInt32> = spawn {
        test.fetchAnd(125)
    }

    let thread3: Future<UInt32> = spawn {
        test.fetchAnd(123)
    }

    let thread4: Future<UInt32> = spawn {
        test.fetchAnd(119)
    }

    let thread5: Future<UInt32> = spawn {
        test.fetchAnd(111)
    }

    let thread6: Future<UInt32> = spawn {
        test.fetchAnd(95)
    }

    let thread7: Future<UInt32> = spawn {
        test.fetchAnd(63)
    }

    while (test.load() != 0) {
        sleep(0)
    }
    print(test.load().toString() + "\n")
    return 0
}
