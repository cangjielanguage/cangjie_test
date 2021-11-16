// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

func main(): Int64 {
    var str:List<String> = ["a","b","c"]
    var r1:Buffer<String> = Buffer<String>(str)
    var r2:Buffer<String> = Buffer<String>([])
    r1.insertAll(Int64(2),r2)
    if ( r1[0]!= "a" ){
        return 1
    }
    if ( r1[1]!= "b" ){
        return 2
    }
    if ( r1[2]!= "c" ){
        return 3
    }
    return 0
}
