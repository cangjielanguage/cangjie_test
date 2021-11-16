// DEPENDENCE: b.cj b.cfg
// EXEC: %compiler %cmp_opt -c b.cj -o b.o
// EXEC: %compiler %cmp_opt %f -import-config b.cfg b.o -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan append
package pkg314
import b.*

record A {
}

append A with TR{
  func test(a:A):Unit{print("append")}
}


func main():Int64{
    test<A>(A())
    return 0
}