// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://192.168.0.1:8080"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parseRequestURI(i).getOrThrow()
    var d = s.port()
    var d1 = s1.port()
    if( d != "8080"){
        return 1
    }
    if( d1 != "8080"){
        return 2
    }
    return 0
}