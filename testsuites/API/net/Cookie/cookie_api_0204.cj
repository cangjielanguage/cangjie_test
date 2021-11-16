// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
var cookie = Cookie("12AB","79ab",path:"/a1/B")
var cookie1 = Cookie("12AB","",path:"A/1b")
func main(): Int64 {
    var a = cookie.toString()
    var a1 = cookie1.toString()
    if( a != "12AB=79ab; Path=/a1/B"){
        return 1
    }
    if( a1 != "12AB=; Path=A/1b"){
        return 2
    }
    return 0
}