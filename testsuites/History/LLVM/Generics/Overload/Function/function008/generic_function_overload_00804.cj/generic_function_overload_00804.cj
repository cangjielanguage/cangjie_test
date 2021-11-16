// DEPENDENCE: a.cj a.cfg
// EXEC: %compiler %cmp_opt -c a.cj -o a.o
// EXEC: %compiler %cmp_opt %f -import-config a.cfg a.o -o %output
// EXEC: %run %run_opt %output %run_args

package pkg801
import a.*

trait TR{func test(a:This):This}
append Int64 with TR{func test(a:Int64){return 2}}


func main():Int64{
    var I = test(1)
    if (I != 2) {
        return 1
    }
    return 0
}