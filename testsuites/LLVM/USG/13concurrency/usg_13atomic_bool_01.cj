// EXEC: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

from std import sync.*


func main(): Int64 {
    var obj = AtomicBool(true)
    var x = obj.load() // x：true，类型为 Bool
    if (!x){return 1}

    return 0
}
