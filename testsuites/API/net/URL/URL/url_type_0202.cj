// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://:789ad@"
    var i1 = "http://:789ad@121www.asd12.com:789"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parse(i1).getOrThrow()
    var d = s.toString()
    var d1 = s1.toString()
    if( d != "http:"){
        return 1
    }
    if( d1 != "http://121www.asd12.com:789"){
        return 2
    }
    return 0
}