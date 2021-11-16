// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import time.*
var time1 = Time(2022,January,19)
var cookie = Cookie("","",expires:time1)
var cookie1 = Cookie("","79ab",expires:time1)
func main(): Int64 {
    var a = cookie.toString()
    var a1 = cookie1.toString()
    if( a != ""){
        return 1
    }
    if( a1 != ""){
        return 2
    }
    return 0
}