// EXEC: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

from std import sync.*

class A {}

func main(): Int64 {
    
    var t1 = A()
    var obj2 = AtomicReference(t1)
    var x = obj2.load() // x 和 t1 是同一个对象
    var t2 = A()
    
    var y = obj2.compareAndSwap(t2, A()) // t2 和 t1 不是同一个对象，CAS 失败，y:false
    if(y){return 1}
    
    y = obj2.compareAndSwap(t1, t2) // CAS 成功，y：true
    if (!y){return 2}
    
    return 0

}
