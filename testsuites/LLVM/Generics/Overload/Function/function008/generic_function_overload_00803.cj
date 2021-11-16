// DEPENDENCE: a.cj a.cfg
// EXEC: %compiler %cmp_opt -c a.cj -o a.%middle
// EXEC: %compiler %cmp_opt %f  a.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package pkg801
import a.*

external func test(a:Int64){return 2}



func main():Int64{
    var I = test(1)
    if (I != 2) {
        return 1
    }
    return 0
}
