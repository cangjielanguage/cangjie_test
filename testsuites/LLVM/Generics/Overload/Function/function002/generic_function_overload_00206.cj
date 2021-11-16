// DEPENDENCE: a.cj a.cfg
// EXEC: %compiler %cmp_opt -c a.cj -o a.%middle 
// EXEC: %compiler %cmp_opt %f  a.%middle -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan top

package pkg206
import a.*

func test(a:Int64){print("top")}


func main():Int64{
    test(1)
    return 1
}
