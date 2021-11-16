// DEPENDENCE: b.cj b.cfg
// EXEC: %compiler %cmp_opt -c b.cj -o b.%middle
// EXEC: %compiler %cmp_opt %f  b.%middle -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan top

package pkg207
import b.*

func test(a:Int64){print("top")}


func main():Int64{
    test(1)
    return 1
}
