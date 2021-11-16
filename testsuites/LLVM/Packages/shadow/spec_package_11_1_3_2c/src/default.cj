// DEPENDENCE: p1 p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import p1.f1 as f // Ok, overloaded.
import p2.f2 as f // Ok, overloaded

func f(a: Int32) { return 3} // Ok, overloaded.
func main() {
    if ( f(1) != 3 ){
        return 1
    }
    return 0
}