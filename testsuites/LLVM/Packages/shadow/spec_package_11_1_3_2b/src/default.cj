// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import p1.f1 as a
import p1.f1 as b
func main() {
    if ( a() != 1 ){
        return 1
    }
    if ( b() != 1 ){
        return 1
    }
    return 0
}
