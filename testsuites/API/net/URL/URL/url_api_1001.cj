// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://192.168.0.1"
    var i1 = "http:other.example.com/%2F/%2F"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parseRequestURI(i1).getOrThrow()
    let s2 = URL.parse(i1).getOrThrow()
    let s3 = URL.parseRequestURI(i).getOrThrow()
    var d = s.port()
    var d1 = s1.port()
    var d2 = s2.port()
    var d3 = s3.port()
    if( d != ""){
        return 1
    }
    if( d1 != ""){
        return 2
    }
    if( d2 != ""){
        return 3
    }
    if( d3 != ""){
        return 4
    }
    return 0
}
