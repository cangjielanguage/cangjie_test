// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import p1.coo
import p1.B

func main(): Int64 {
    var r4 = coo<String>("a")
    if ( r4 != "a" ){
        return 4
    }
    return 0
}
