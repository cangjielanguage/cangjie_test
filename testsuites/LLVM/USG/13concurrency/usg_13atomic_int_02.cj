// EXEC: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

from std import sync.*


func main(): Int64 {
    var obj: AtomicInt32 = AtomicInt32(1)
    var x = obj.load() // x：1，类型为 Int32
    x = obj.swap(2) // x：1
    if (x!=1) {return 1}

    x = obj.load() // x：2
    if (x!=2) {return 2}

    var y = obj.compareAndSwap(2, 3) // y：true，类型为 Bool
    if (!y) {return 3}

    y = obj.compareAndSwap(2, 3) // y：false，obj 中数值不再是 2，而是 3，所以 CAS 操作失败
    if (y) {return 4}

    x = obj.fetchAdd(1) // x：3
    if (x!=3) {return 5}

    x = obj.load() // x：4
    if (x!=4) {return 6}

    return 0
}
