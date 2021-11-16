// DEPENDENCE: a.cj a.cfg
// EXEC: %compiler %cmp_opt -c a.cj -o a.o
// EXEC: %compiler %cmp_opt %f -import-config a.cfg a.o -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan append
package pkg312
import a.*

trait TR{func test(a:This):Unit}
append Int64 with TR{
  func test(a:Int64):Unit{print("append")}
}


func main():Int64{
    test(1)
    return 0
}