// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import p1.aoo

func main(): Int64 {
    var r1 = aoo<Int32>
    if ( r1(1)(1) != 1 ){
        return 1
    }
    return 0
}
