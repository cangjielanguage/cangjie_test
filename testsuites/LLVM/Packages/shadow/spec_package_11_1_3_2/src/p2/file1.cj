package p2
import p1.foo as f1 // rename foo defined in p1 as f1
func foo() {return 1}
external var result1 = f1()
external var result2 = foo()