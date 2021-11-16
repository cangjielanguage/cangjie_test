// DEPENDENCE: ../resa
// EXEC: %compiler %cmp_opt -c resa/r03.cj -o resa.%middle && %copycharjs resa
// EXEC: %compiler %cmp_opt %f resa.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package testcase
import resa.*

func main():Int64 {
    if ( a != 1) {
        return 1
    }
    return 0
}
