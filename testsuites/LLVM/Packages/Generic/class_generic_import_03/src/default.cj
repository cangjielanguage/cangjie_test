// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import p1.A
import p1.B as Boo

func main(): Int64 {
    if ( A<Int32>.a != 1 ){
        return 1
    }
    var a = Boo<Int32>.a
    var r1 = match (a) {
        case Some(v) => v
        case None => 1
    }
    if ( r1 != 1 ){
        return 4
    }
    return 0
}
