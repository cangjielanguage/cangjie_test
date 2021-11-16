// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import p1.A
import p1.C as Coo

func main(): Int64 {
    if ( Coo<Int32>.m != 1 ){
        return 1
    }
    Coo<Int32>.m = 1
    if ( Coo<Int32>.m != 2 ){
        return 2
    }
    var a1 = A<Int32>.m
    var r1 = match (a1) {
        case Some(v) => v
        case None => 1
    }
    if ( r1 != 1 ){
        return 3
    }
    A<Int32>.m = Option.Some(2)
    var a2 = A<Int32>.m
    var r2 = match (a2) {
        case Some(v) => v
        case None => 1
    }
    if ( r2 != 2 ){
        return 4
    }
    var a3 = A<Int32>.n
    var r3 = match (a3) {
        case Some(v) => v
        case None => 1
    }
    if ( r3 != 2){
        return 5
    }
    return 0
}
