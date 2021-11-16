// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import p1.aoo
import p1.boo as B

func main(): Int64 {
    var r1 = aoo<Int32>
    if ( r1(1) != 1 ){
        return 1
    }
    var r2 = B<Int32,String>
    if ( r2(1,"") != 1 ){
        return 2
    }
    var r3 = p1.aoo<Int32>(1)
    if ( r3 != 1 ){
        return 3
    }
    return 0
}
