// DEPENDENCE: ../resa
// EXEC: %compiler %cmp_opt -c resa/r02.cj -o resa.%middle && %copycharjs resa
// EXEC: %compiler %cmp_opt %f resa.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package testcase
import resa.*

func main():Int64 {
    if ( a != 1 ) {
        return 1
    }
    if ( b != 2 ) {
        return 2
    }
    return 0
}
