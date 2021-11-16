// DEPENDENCE: b.cj b.cfg
// EXEC: %compiler %cmp_opt -c b.cj -o b.%middle
// EXEC: %compiler %cmp_opt %f  b.%middle -o %output
// EXEC: %run %run_opt %output %run_args
package pkg802
import b.*

external func test<T>(a:T){return 2}

func main():Int64{
    var I = test(Int64(1))
    if (I != 2) {
        return 1
    }
    return 0
}
