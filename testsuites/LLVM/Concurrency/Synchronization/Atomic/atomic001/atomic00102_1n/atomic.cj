// EXEC:%compiler %cmp_opt %sync-link %f -o %output 2>&1 | compare %f

from std import sync.*

func main(): Int64 {
    let test = AtomicInt8(1)
    test.store(0)

    let thread: Future<Unit> = spawn {
        test.store(-129) // EXPECTED: regex the number '-129' exceeds the value range of type 'Int8'
    }

    test.store(128) // EXPECTED: regex the number '128' exceeds the value range of type 'Int8'

    return 0
}
