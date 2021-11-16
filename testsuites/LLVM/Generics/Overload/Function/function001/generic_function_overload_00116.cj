// DEPENDENCE: a.cj a.cfg
// EXEC: %compiler %cmp_opt -c a.cj -o a.%middle
// EXEC: %compiler %cmp_opt %f a.%middle -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan inside
package pkg115

import a.*

open class A<T>{
    func test(a:T){print("inside")}
    var i : T
    init(a: T) { this.i = a }
    func b(){
        test(i)
    }
}
func main():Int64{
    A<Int64>(0).b()
    return 0
}
