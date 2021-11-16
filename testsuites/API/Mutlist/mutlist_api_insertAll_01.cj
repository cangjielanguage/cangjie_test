// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

func main(): Int64 {
    var str:List<String> = ["a","b","c"]
    var r1:Buffer<String> = Buffer<String>(str)
    var r2:Buffer<String> = Buffer<String>(["d","e","f"])
    r1.insertAll(Int64(0),r2)
    if ( r1[0]!= "d" ){
        return 1
    }
    if ( r1[1]!= "e" ){
        return 2
    }
    if ( r1[2]!= "f" ){
        return 3
    }
    if ( r1[3]!= "a" ){
        return 4
    }
    if ( r1[4]!= "b" ){
        return 5
    }
    if ( r1[5]!= "c" ){
        return 6
    }
    return 0
}
